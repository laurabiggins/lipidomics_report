# This is the script called by lipidomics_report_wrapper.R

# required packages that aren't all explicitly loaded
packages_required <- c("tidyverse", "ggplot2", "tools", "assertthat", "rstatix",
                       "knitr", "DT", "plotly", "pheatmap", "rmarkdown", "RColorBrewer")
if(!all(packages_required %in% rownames(installed.packages()))) {
  stop(
    paste0(
      "installation required for package(s) ", 
      packages_required[!packages_required %in% rownames(installed.packages())]
  ))
}

config <- switch(tools::file_ext(config_file), 
                 tsv = ,
                 txt = readr::read_tsv(config_file, col_names = FALSE),
                 csv = readr::read_csv(config_file, col_names = FALSE),
                 stop("Unknown file extension on config file")
)

config <- tibble::deframe(config)

expected_config_fields <- c(
  "data_file_path", 
  "metadata_file", 
  "outfile", 
  "control", 
  "test_run",  
  "matched_samples", 
  "bar_class_ylabel"
)

# Validity checks
assertthat::validate_that(
  all(names(config) %in% expected_config_fields),
  msg = paste0(
    "Unexpected parameter name found in config file. The culprit is ", 
    paste0(names(config)[!(names(config) %in% expected_config_fields)], collapse = ", "),
    ". This/these will be ignored."
  )  
)

assertthat::assert_that(file.exists(config[["data_file_path"]]))

assertthat::assert_that(file.exists(config[["metadata_file"]]))

assertthat::assert_that(
  nchar(config[["outfile"]]) >= 1, 
  msg = "outfile name must be supplied"
)
assertthat::assert_that(
  nchar(config[["control"]]) >= 1, 
  msg = "Name of control condition must be supplied"
)
assertthat::validate_that(
  nchar(config[["bar_class_ylabel"]]) > 0,
  msg = paste0("bar_class_ylabel value not found, will be left blank on plots")
)

# everything gets read in as characters so these need converting to logical
assertthat::assert_that(
  config[["matched_samples"]] %in% c("TRUE", "FALSE"),
  msg = paste0("matched_samples option must be TRUE or FALSE, value found = ", config[["matched_samples"]])
)
matched_samples <- as.logical(config[["matched_samples"]])

assertthat::assert_that(
  config[["test_run"]] %in% c("TRUE", "FALSE"),
  msg = paste0("quick_test option must be TRUE or FALSE, value found = ", config[["test_run"]])
)
test_run <- as.logical(config[["test_run"]])


library(magrittr)
source("R/utils.R")
create_report(
  data_file = normalizePath(config[["data_file_path"]]), 
  metadata_file = normalizePath(config[["metadata_file"]]), 
  outfile_name = config[["outfile"]], 
  bar_class_ylabel = config[["bar_class_ylabel"]],
  control = config[["control"]],
  quick_test = test_run,
  matched = matched_samples
)
