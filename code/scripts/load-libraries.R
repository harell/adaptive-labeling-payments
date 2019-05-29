################################################################################
#                           Load project's libraries                           #
################################################################################
#' browseVignettes()
#'
#' There are three groups for the project's packages:
#' 1. Package is on GitHub; install and load the latest package from GitHub.
#' 2. Package is on MRAN; install and load a spesific package version from CRAN.
#' Comments:
#' * The 1nd group can include:
#'    * Packages that were not present during the original experiment, or
#'    * packages that are not relevant for reproducibility (e.g. ggplot2) or
#'    * packages from CRAN which should be in their latest version (e.g. dropbox).
#' * The 2nd group is usful for reproducible research
#'
paste0(R.Version())[c("major", "minor")]
k_snapshot_date <<- "2016-05-26"
k_path_project <<- getwd()
k_path_checkpoint <<- file.path(k_path_project, ".checkpoint")
k_path_libraries <<- .libPaths()[which.min(nchar(.libPaths()))]
#'
####################
# Input validation #
####################
stopifnot(exists("create_requirements_file"))
#' Check R version
d1 <- as.numeric(R.Version()$major)
d2 <- as.numeric(substr(R.Version()$minor, 1, 1))
d3 <- as.numeric(substr(R.Version()$minor, 3, 3))
if (d1 != 3 | d2 > 4) {
    stop(
        "\nThe project was tasted with R version 3.4.3",
        "\nYou are using R version ", paste0(R.Version()[6:7], collapse = "."),
        "\nWe can't guarantee the results are reproducible"
    )
}
#'
############################
# Define project libraries #
############################
project_packages <- c(
    # Classification Algorithms
    "randomForest", "e1071", "ipred",
    # Evaluating learning algorithms
    "ROCR", "AUC",
    # Parallel Tools
    "doParallel", "doSNOW", "foreach",
    # Spam dataset
    "kernlab",
    # Read/Write files
    "yaml", "readr",
    # Defensive R Programming
    "assertive",
    # Unit Testing
    "testthat",
    # Data Manipulation
    "data.table", "DBI", "lazyeval", "dplyr", "magrittr", "stringr",
    "reshape2", "magrittr",
    # Dynamic Report Generation in R
    "knitr", "pander",
    # Visualization tools
    "ggplot2", "gridExtra"
)
#'
###########################
# Install & Load Packages #
###########################
#' Step 0: Remove all packages that do not come with R
#' remove.packages( installed.packages( priority = "NA" )[,1] )
#'
#' Step 1: Explicitly tell the package manager what libraries to include
create_requirements_file(project_packages)
#' Step 2: Install packages from MRAN
message("# Install and load the project packages")
suppressWarnings(if(!require(checkpoint)) install.packages("checkpoint"))
dir.create(k_path_checkpoint, showWarnings = FALSE, recursive = TRUE)
checkpoint::checkpoint(k_snapshot_date, checkpointLocation = k_path_project)
#' Step 3: Make sure all packages were installed correctly
libraries_on_System <- row.names(installed.packages())
assertive::assert_is_subset(project_packages, libraries_on_System)
#' Step 4: Load project packages
suppressMessages(
    invisible(
        sapply(project_packages, function(x) try(require(x, character.only = TRUE), silent = TRUE))
    )
)
