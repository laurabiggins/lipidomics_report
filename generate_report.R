source("R/utils.R")

#========================================================================
# Change the options below to the correct file names and paths
# examples of data files can be seen here in the GitHub repository here:
# https://github.com/laurabiggins/lipidomics_report
#========================================================================
#
# the input dataset and metadata file - these need to be full paths and contain the 
# file suffix e.g. .csv/.txt
data_file_path <- "D:/projects/lipidomics/example_data/CSC/datasets/alldata.lipidomics_summary_MiaPaca2_Parental-CSC.csv"
meta_file <- "D:/projects/lipidomics/example_data/CSC/metadata_4_reps.txt" 

# name of the output file - this doesn't need be a full path or contain a file suffix
outfile <- "MiaPaca2_Parental-CSC"

# whether the experimental design is matched/paired or not. TRUE or FALSE value required here.
matched <- FALSE


#==============================================
# The code below should be run but not changed
#==============================================
create_report(
  data_file = data_file_path, 
  metadata_file = meta_file, 
  outfile_name = outfile, 
  matched = matched_samples
)




# for multiple files
# data_folder <- "D:/projects/lipidomics/example_data/CSC/datasets/" 
# file_paths <- list.files(data_folder,full.names = TRUE)