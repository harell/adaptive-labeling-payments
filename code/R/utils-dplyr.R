# drop_na -----------------------------------------------------------------
drop_na <- function(.data) {
    
    if (packageVersion("dplyr") >= "0.7") {
        tidyr::drop_na(.data)
    } else {
        .data[complete.cases(.data), ]
    }
}

# group_vars --------------------------------------------------------------
group_vars <- function(.data) {
    if (packageVersion("dplyr") >= "0.7") {
        dplyr::group_vars(.data)
    } else {
        attr(.data, "vars") %>% as.character()
    }
}

