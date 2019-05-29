get_the_data <- function(DATABASE_NAME) {
    assertive::is_single_character(DATABASE_NAME)
    switch(tolower(DATABASE_NAME),
        "spam" = {
            library("kernlab")
            data(spam)
            dataset <- spam
        },
        "mushroom" = source("./data/Mushroom/import dataset.R"),
        "pen digits" = source("./data/Pen Digits/import dataset.R"),
        stop("Unknown data set")
    )
    dataset <<- setVariablesNames(dataset)
    return(invisible())
}
