# We have various permutations of samples so need appropriate stats. 
# assume data is normally distributed - there's no point doing a test for normality 
# as there are so few values per sample.
# 



#' Do stats
#' 
#' This is a wrapper around decide_test() and do_test(), which checks properties 
#' of the data (per lipid), decides on the appropriate statistical test, and runs
#' it, producing a p-value.
#'
#' @param tidy_dataset 
#' @param stats_summary 
#' @param paired 
#'
#' @return
#' @export
#'
#' @examples
do_stats <- function(tidy_dataset, stats_summary, paired = FALSE){
  
  n_counts <-  tidy_dataset %>%
    dplyr::group_by(lipid_name, condition) %>%
    summarise(n_values = n(), n_non0 = sum(value > 0), n0 = sum(value == 0)) %>%
    ungroup() 

  #browser()
      
 x <- left_join(n_counts, stats_summary) %>%
    group_by(lipid_name) %>%
    mutate(test_type = decide_test(cur_data(), paired)) %>%
    ungroup() %>%
    select(lipid_name, test_type) %>%
    distinct() %>%
    right_join(tidy_dataset) %>%
    dplyr::group_by(lipid_name) %>%
    mutate(p_val = do_test(cur_data())) %>%
    #mutate(adj_pval = p.adjust(p_val, method = "BH")) %>%
    ungroup()
}

# y <- left_join(n_counts, stats_summary) %>%
#   group_by(lipid_name) %>%
#   mutate(test_type = decide_test(cur_data(), paired)) %>%
#   ungroup() %>%
#   select(lipid_name, test_type) %>%
#   distinct() %>%
#   right_join(tidy_dataset) %>%
#   filter(lipid_name == "PC 38:1")
# 
#   dplyr::group_by(lipid_name) %>%
#   mutate(p_val = do_test(cur_data())) %>%
#   ungroup()



#  y <- left_join(n_counts, stats_summary) %>%
#   group_by(lipid_name) %>%
#   mutate(test_type = decide_test(cur_data())) %>%
#   # slice(1) %>%
#   ungroup() %>%
#   select(lipid_name, test_type) %>%
#   right_join(tidy_dataset) %>%
#   #dplyr::group_by(lipid_name) %>%
#   slice(1:12)
# 
# 
#y <- left_join(n_counts, stats_summary) %>%
#   slice(1:2)

 

#' For calculating standard deviation ratio between 2 condition types
#'
#' @param df with column names that must include lipid_name, condition, stdev
#'
#' @return tibble containing columns lipid name, sd_ratio
#' @export
#'
#' @examples
get_sd_ratio <- function(df){
  
  conditions <- unique(df$condition)
  assertthat::assert_that(
    nrow(df) == 2, 
    msg = paste0("expected to find 2 conditions, actually found ", conditions)
  )
  
  max(df$stdev)/min(df$stdev)
}


#' get sd ratio validity
#' 
#' To be used alongside get_sd_ratio, and with the same input data, it was just 
#' easier to have the function return a single value.
#' This checks if the larger standard deviation also has the larger mean 
#'
#' @param df tibble/dataframe containing columns named "mean", "stdev" and "condition"
#'
#' @return TRUE or FALSE value
#' @export
#'
#' @examples
get_ratio_validity <- function(df){
  
  conditions <- unique(df$condition)
  assertthat::assert_that(
    nrow(df) == 2, 
    msg = paste0("expected to find 2 conditions, actually found ", conditions)
  )
  which.max(df$mean) == which.max(df$stdev)
}

#' get_fold_change
#' 
#' For calculating fold change between 2 conditions. This needs expanding to deal
#' with more than 2 conditions, but should 
#'
#' @param df with column names lipid_name, condition, mean
#'
#' @return tibble containing columns lipid name, fold change
#' @export
#'
#' @examples
get_fold_change <- function(df){
  
  conditions <- unique(df$condition)

  if(length(conditions) == 3){
    stop("populate this for > 2 conditions")
  }
  
  fc_name <- paste0("FC_", conditions[1], "_", conditions[2])
    
  fc_data <- pivot_wider(
    df,
    id_cols = c(lipid_name, condition, mean), 
    names_from = condition, 
    values_from = mean,
  ) %>%
    mutate(fold_change = .data[[conditions[1]]]/.data[[conditions[2]]]) %>%
    rename(!!fc_name := fold_change) 
  
  fc_data %>%
    select(-all_of(conditions))
}


#' For calculating fold change between 2 conditions. Another function would be needed
#' for more than 2 conditions
#'
#' @param df with column names lipid_name, condition, mean
#'
#' @return tibble containing columns lipid name, fold change
#' @export
#'
#' @examples
get_fold_change_2_conditions <- function(df){
  
  conditions <- unique(df$condition)
  assertthat::assert_that(
    length(conditions) == 2, 
    msg = paste0("expected to find 2 conditions, actually found ", conditions)
  )
    
  pivot_wider(
    df,
    id_cols = c(lipid_name, condition, mean), 
    names_from = condition, 
    values_from = mean,
  ) %>%
    mutate(fold_change = .data[[conditions[1]]]/.data[[conditions[2]]]) %>%
    select(lipid_name, fold_change)
}

  

#' Do statistical test
#' 
#' performs test on data depending on the type defined in the "test_type" column.
#'
#' @param df with a column named condition and one named test_type
#' that contains values of "none", "linear_t_test", "log2_t_test", "linear_paired_t-test",
#' "log2_paired_t-test", "Welch", "anova"
#'
#' @return p-value
#' @export
#'
#' @examples
do_test <- function(df){

  assertthat::assert_that(length(unique(df$test_type)) == 1,
    msg = paste0(
      "no of unique test types per lipid name should have been 1, but it was",
      length(unique(df$test_type))
    )
  )
  
  test <- df$test_type[1]
  
  switch(test,
            linear_t_test = rstatix::t_test(df, value ~ condition, paired = FALSE)$p,
            log2_t_test = rstatix::t_test(df, log2_value ~ condition, paired = FALSE)$p,
            linear_paired_t_test = rstatix::t_test(df, value ~ condition, paired = TRUE)$p,
            log2_paired_t_test = rstatix::t_test(df, log2_value ~ condition, paired = TRUE)$p,
            Welch = rstatix::welch_anova_test(df, value ~ condition)$p,
            one_sample_t_test = one_sample_wrapper(df),
            none = NA,
            paired_none = NA
        )
}


one_sample_wrapper <- function(df){
  
  #browser()
  
  n_counts <- df %>% 
    group_by(condition) %>%
    summarise(n_values = n(), n_non0 = sum(value > 0), n0 = sum(value == 0))
  
  non0_condition <- n_counts %>%
    filter(n0 == 0) %>%
    pull(condition)
  
  #stopifnot(length(non0_condition) == 1, msg = "one sample t-test going wrong")
  
  mu_value <- df %>%
    filter(condition != non0_condition) %>%
    pull(value) %>%
    max()
  
  res <- df %>%
    filter(condition == non0_condition) %>%
    rstatix::t_test(value ~ 1, mu = mu_value)
  
  res$p
}

#' decide_test
#' 
#' Decide which statistical test should be performed depending on a range of 
#' variables
#'
#' @param df with columns n0 and n-non0 that contain number of 0 values and number of
#' non-zero values, in addition to columns named sd_ratio and valid_ratio that 
#' contain the ratio of standard deviations between conditions and whether that
#' ratio is valid (see get_sd_ratio and get_ratio_validity) 
#' 
#' @param paired TRUE or FALSE - whether the samples are paired or not
#' @param threshold integer value. standard deviation ratio threshold
#' 
#' @return
#' @export
#'
#' @examples
decide_test <- function(df, paired, threshold = 2) {
 
  # check if the df has columns n0 and n-non0
   
  if (nrow(df) < 2){
    test <- "none"
  } else if (nrow(df) == 2){
    
      sufficient_values <- df$n_non0 >= 2 & df$n0 <= 1 
      ratio <- df$sd_ratio[1]
      valid <- df$valid_ratio[1]
      
      if (all(sufficient_values)) {
        if (paired) {
          if (ratio < threshold) {
            test <- "linear_paired_t_test"
          } else {
            if (valid) {
              test <- "log2_paired_t_test"
            } else {
              test <- "paired_none"
            }
          }
        } else {
          if (valid) {
            if (ratio < threshold) {
              test <- "linear_t_test"
            } else {
              test <- "log2_t_test"
            }
          } else {
            test <- "Welch"
          }
        }
      } else if ((any(df$n_non0 <=1) & any(df$n0 == 0))){
        test <- "one_sample_t_test"
      } else {
        if (paired) test <- "paired_none"
        else test <- "none"
      }
  } else {
    test <- "anova_if_valid"
  }
  test
}            

#' Statistical test information
#' 
#' To supply some text about a statistical test that was performed
#'
#' @param stat_test string, one of those in the switch statement
#'
#' @return string, piece of information about the test
#' @export
#'
#' @examples
#' stat_test_info("log2_t_test")
stat_test_info <- function(stat_test){
  
  switch(stat_test, 
         linear_t_test = "Independent t-test performed on linear data. 
         The ratio of standard deviations between the conditions was small enough that the data did not need to be log transformed. The samples were not paired.",
         log2_t_test = "Independent t-test performed on log2 transformed data. The ratio of standard deviations between the conditions exceeded a threshold and so the data was log2 transformed. The samples were not paired.",
         linear_paired_t_test = "Paired t-test performed on linear data. \n The ratio of standard deviations between the conditions was small enough that the data did not need to be log transformed. \n The samples were paired.",
         log2_paired_t_test = "Paired t-test performed on log2 transformed data. The ratio of standard deviations between the conditions exceeded a threshold and so the data was log2 transformed. The samples were paired.",
         Welch = "Welch t-test performed on linear data. The condition with the smaller mean had a higher standard deviation so a Welch t-test was performed. The samples were not paired.",
         one_sample_t_test = "The data did not meet the criteria for performing a two sample t-test. One of the conditions had almost all 0 values, so a one-sample t-test was performed for the other condition. The results of this test may not be very robust and the plot should be viewed carefully to understand the data.",
         none = "The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.",
         paired_none = "The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high."
         )
}
