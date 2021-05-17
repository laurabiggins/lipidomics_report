#========================================================================
# Change the options below to the correct file names and paths
# examples of data files can be seen in the GitHub repository here:
# https://github.com/laurabiggins/lipidomics_report
#========================================================================

# required packages that aren't explicitly loaded
# tools, assertthat, rstatix, knitr, DT, plotly, pheatmap, rmarkdown
packages_required <- c("tidyverse", "ggplot2", "tools", "assertthat", "rstatix",
                       "knitr", "DT", "plotly", "pheatmap", "rmarkdown", "RColorBrewer")
if(!all(packages_required %in% rownames(installed.packages()))) {
  print(paste0(
    "please install the package ", 
    packages_required[!packages_required %in% rownames(installed.packages())]
  ))
} else { print("Looks like all the required packages are installed, please continue...")}


# The input dataset and metadata file - these can be full or relative paths and 
# must contain the file suffix e.g. .csv/.txt/.tsv
#data_file_path <- "data/alldata.lipidomics_summary_test_data.tsv"
#meta_file <- "data/metadata.txt"

data_file_path <- "../example_data/20210512/alldata.lipidomics_summary.tsv"
meta_file <- "../example_data/20210512/metadata.txt"


# Name of the output file - this doesn't need be a full path or contain a file suffix.
# By default, a folder named "output" will be created in the directory containing 
# the data_file and that will contain the output file.
#outfile <- "example_data"

outfile <- "output"

# Whether the experimental design is matched/paired or not. TRUE or FALSE value required here.
# Explanation of independent vs matched design can be found here:
# https://github.com/laurabiggins/lipidomics_report/blob/main/info/Experimental_design_independent_vs_matched.pdf
#matched_samples <- FALSE

matched_samples <- TRUE

# To generate the full report test_run should be set to FALSE
# If TRUE, it speeds up the report generation by only plotting 3 of the individual plots
test_run <- TRUE

# label for y axis in class bar plots, must be text surrounded by quotes.
bar_class_ylabel <- ""

# Name of "control" condition, this must match the name of the condition in the metadata file.
control <- "Control"

#==============================================
# The code below should be run but not changed
#==============================================
source("R/utils.R")
create_report(
  data_file = normalizePath(data_file_path), 
  metadata_file = normalizePath(meta_file), 
  outfile_name = outfile, 
  quick_test = test_run,
  matched = matched_samples,
  bar_class_ylabel = bar_class_ylabel,
  control = control
)


# Other example paths on my Windows machine
# data_file_path <- "D:/projects/lipidomics/example_data/CSC/datasets/alldata.lipidomics_summary_MiaPaca2_Parental-CSC.csv"

# meta_file <- "D:/projects/lipidomics/example_data/CSC/metadata_4_reps.txt" 


# for multiple files
# data_folder <- "D:/projects/lipidomics/example_data/CSC/datasets/" 
# file_paths <- list.files(data_folder,full.names = TRUE)
# loop through these