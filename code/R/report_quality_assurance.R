report_quality_assurance <- function(report) {
    expect_cols <- c(
        "instance_num", "pay", "assert_all_are_greater_than_or_equal_to", "change", "cost_so_far",
        "AUC_holdout", "full_AUC", "subset_AUC"
    )
    actual_cols <- report %>% colnames()
    # assertive::assert_all_are_true(actual_cols %in% expect_cols)
    assertive::assert_all_are_not_na(report %>% select(instance_num, batch))
    assertive::assert_all_are_greater_than_or_equal_to(report %>% .$batch %>% diff(), 0)
    assertive::assert_all_are_greater_than_or_equal_to(report %>% .$instance_num %>% diff(), 0)
}
