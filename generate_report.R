#========================================================================
# Change the options below to the correct file names and paths
# examples of data files can be seen in the GitHub repository here:
# https://github.com/laurabiggins/lipidomics_report
#========================================================================

# The input dataset and metadata file - these can be full or relative paths and 
# must contain the file suffix e.g. .csv/.txt/.tsv
data_file_path <- "data/alldata.lipidomics_summary_test_data.tsv"
meta_file <- "data/metadata.txt"

# Name of the output file - this doesn't need be a full path or contain a file suffix.
# By default, a folder named "output" will be created in the directory containing 
# the data_file and that will contain the output file.
outfile <- "example_data"

# Whether the experimental design is matched/paired or not. TRUE or FALSE value required here.
# Explanation of independent vs matched design can be found here:
# https://github.com/laurabiggins/lipidomics_report/blob/main/info/Experimental_design_independent_vs_matched.pdf
matched_samples <- FALSE


#==============================================
# The code below should be run but not changed
#==============================================
source("R/utils.R")
create_report(
  data_file = normalizePath(data_file_path), 
  metadata_file = normalizePath(meta_file), 
  outfile_name = outfile, 
  matched = matched_samples
)


# Other example paths on my Windows machine
# data_file_path <- "D:/projects/lipidomics/example_data/CSC/datasets/alldata.lipidomics_summary_MiaPaca2_Parental-CSC.csv"
# meta_file <- "D:/projects/lipidomics/example_data/CSC/metadata_4_reps.txt" 


# for multiple files
# data_folder <- "D:/projects/lipidomics/example_data/CSC/datasets/" 
# file_paths <- list.files(data_folder,full.names = TRUE)
# loop through these