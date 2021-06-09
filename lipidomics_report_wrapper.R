# examples of data files can be seen in the GitHub repository here:
# https://github.com/laurabiggins/lipidomics_report
#========================================================================


#config_file <- "D:\\projects\\lipidomics\\example_data\\CSC\\config_miapaca.txt"
#config_file <- "D:\\projects\\lipidomics\\lipidomics_report\\data\\config.csv"

config_file <- file.choose()

source("generate_report.R")
