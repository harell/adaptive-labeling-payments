#' Labeling cost/quality tradeoff
#'
#' Initial Suggested Functions for simulating the tradeoff between labeling
#' accuracy (P-probability that a label will correctly classify an instance)
#' and C (cost – price paid for the instance):
#'
#' @param method Tradeoff function:
#' 'Fix' returns the same probability for any price. (Mason and Watts, 2009).
#' 'Concave' produces lower probabilities in the cost range, where the highest
#' probability is somewhere in the middle. (Donghui et al., 2009)
#' 'Asymptotic' the probability increases.
#' 'Quality' the strict probability to assign return,
#' e.g. costPerTask=0.8 would return probability=0.8.
#' 'HashTable' maps costs to probabilities.
#' The user should add a dataframe with two columns: "cost" and "probability".
#' The dataframe is passed with the fixProbability input argument.
#' @param costPerTask Price paid to classify an instance.
#' Need to be in the range [0.02,0.25].
#' @return The probability \code{p}.
#'

labelingCostQualityTradeoff <- function(method = c("Fix", "Concave", "Asymptotic", "HashTable"),
                                        costPerTask = NULL,
                                        fixProbability = NULL) {
    stopifnot(length(method) == 1)
    method <- tolower(method)
    C_Range <- c(0.02, 0.25) # define the cost range
    C <- costPerTask


    # Check for null values. If TRUE then set the default
    if (is.null(method)) method <- "fix"
    if (is.null(costPerTask)) costPerTask <- 0.1
    if (is.null(fixProbability)) fixProbability <- 0.75


    if (method == "fix") {
        p <- rep(fixProbability, length(C))
    } else if (method == "concave") {
        p <- 0.48 + 0.066 * (100 * C) - 0.0022 * (100 * C)^2
    } else if (method == "asymptotic") {
        p <- 1 - 1 / (C * 100)
    } else { # Hashtable
        #assert_data_frame(fixProbability)
        colnames(fixProbability) <- tolower(colnames(fixProbability))
        assert_are_set_equal(colnames(fixProbability), c("cost", "probability"))
        p <- fixProbability[fixProbability$cost %in% C, "probability"]
    }
    # stop('Unknown tradeoff method')


    return(p)
} # end function labelingCostQualityTradeoff
