##################
# Initialization #
##################
message("##################\n# Initialization #\n##################")
## Setup the session
#set ALP_code as the working directory
source(file.path(getwd(), "code", "scripts", "setup.R"))
## Load the configurations
config <- yaml::yaml.load_file(file.path(k_path_code, "config.yml"))
list2env(config, envir = .GlobalEnv)
get_the_data(DATABASE_NAME)
## Calculations
num_price_per_label_values <- length(price_per_label_values) 
num_batches_per_cost_initial_training_set <- ceiling(300 / (k_batch_size * num_price_per_label_values))


#############################
# Simulation Configurations #
#############################
#' Simulation nuances
param <- expand.grid(
  # What inducer should be used to fit models?
  model_inducer = model_inducer,
  # By which rule to decide how much to pay for the next batch?
  payment_selection_criteria = payment_selection_criteria,
  # Quality-Cost tradeoff
  primary_cost_function = primary_cost_function,
  stringsAsFactors = FALSE)
#'
## Hash-table
if(any(param$primary_cost_function %in% "linear")){
  indices <- which(param$primary_cost_function %in% "linear")
  x_in <- range(price_per_label_values)
  y_in <- c(0.83, 0.87)
  x_out <- price_per_label_values
  y_out <- approx(x_in, y_in, x_out)$y   
  fixProbability <- data.frame(cost = x_out, probability = y_out)
  param[indices, "primary_cost_function"] <- "linear" %+% "_" %+% min(y_in) %+% "-" %+% max(y_in)
} 

################################################################################
#' Start simulation
################################################################################
cat_80("Start simulation")
#'
# Detects the number of cores and prepares for parallel run
cl <- makeCluster(detectCores(), outfile = "")
registerDoParallel(cl)
#'
# Run multiple simulations
for (s in 1:nrow(param)) {
    startSimTime <- Sys.time()
    #'
    # Setup simulation parameters
    model_inducer <- param[s, "model_inducer"]
    payment_selection_criteria <- param[s, "payment_selection_criteria"]
    primary_cost_function <- param[s, "primary_cost_function"]
    #'
    # Allocate report
    report <- create_report()
    ledger <- data.frame()
    metadata <- cbind(create_report(), svm_bug = data.frame())
    svm_bug <- NA
    #'
    # Start simulation timer
    start.time <- Sys.time()
    #'
    # Run simulation
    for (current_repetition in 1:repeatitions)
    {
        cost_function_type <- param[s, "primary_cost_function"]
        #' (1) Setup
        repetition_stage_1()
        #' (2) Split the data to 'unlabeled' and 'holdout'
        repetition_stage_2()
        #' (3) Purchase initial batches and fit model on them
        repetition_stage_3()
        #' (4) Running the rest of the simulation
        repetition_stage_4()
    } # repetitions for loop
    #'
    ## Save report on hard drive
    slug <- file_slug_generate()
    write_csv(report %>% select(-svm_bug),
        path = file.path(k_path_reports, slug %+% ".csv")
    )
    write_csv(metadata %>% arrange(repetition, batch),
        path = file.path(k_path_metadata, slug %+% ".csv")
    )
    write_csv(ledger,
        path = file.path(k_path_ledgers, slug %+% ".csv")
    )
} # end multiple simulations
#'
stopCluster(cl)
stop.time <- Sys.time()
cat_80("Completed in " %+% round(as.numeric(stop.time - start.time, units = "mins"), 0) %+% " [mins]")
cat("\n")
#'
