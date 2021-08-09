# This is the script called by lipidomics_report_wrapper.R.
# It checks the validity of arguments in the config file.

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

config <- tibble::deframe(config) # change to named vector

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
# these could be neatened up 
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

# in case we wanted the option to supply a different output location
output_fullpath_supplied <- FALSE
if(output_fullpath_supplied) {
  out_file <- config[["outfile"]]
} else {
  #output_location <- paste0(dirname(config[["data_file_path"]]), "/output")
  output_base <- tools::file_path_as_absolute(dirname(config[["data_file_path"]]))
  output_location <- paste0(output_base,"/output") 
  if(! dir.exists(output_location)) {
    assertthat::is.writeable(output_base) # check it can be created
    dir.create(output_location) 
  }
  out_file <- paste0(output_location, "/", config[["outfile"]])
}

out_file <- paste0(out_file, "_", Sys.Date(), '.html') 

input_file_path <- tools::file_path_as_absolute(config[["data_file_path"]])
meta_filepath <- tools::file_path_as_absolute(config[["metadata_file"]])

rmarkdown::render(
  "R/orbitrap_processing.Rmd",
  params = list(
    input_file =  input_file_path,
    metadata_file =  meta_filepath,
    paired = matched_samples,
    quick_test = test_run,
    output_folder = output_location,
    bar_class_ylabel = config[["bar_class_ylabel"]],
    control = config[["control"]]
  ),
  output_file = (out_file)
)
  