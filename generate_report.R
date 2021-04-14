# rmarkdown::render(
#   "orbitrap_processing.Rmd", 
#   params = list(
#     input_file = "../Steven_orbitrap/alldata.lipidomics_summary.tsv",
#     metadata_file = "../Steven_orbitrap/metadata2.tsv"
#   ),
#   output_file = paste0('lipidomics_report_', Sys.Date(), '.html')
# )


dir.create("output")#, showWarnings = FALSE)
rmarkdown::render(
  "R/orbitrap_processing.Rmd", 
  params = list(
    input_file = "../data/alldata.lipidomics_summary_test_data.tsv",
    metadata_file = "../data/metadata.txt",
    paired = TRUE
  ),
  output_file = paste0('../output/lipidomics_report_test_data_', Sys.Date(), '.html')
)



# rmarkdown::render(
#   "orbitrap_processing.Rmd", 
#   params = list(
#     input_file = "../example_data/Mouse-Ear-Serum/Ear_alldata.lipidomics_summary_4replicas_SYNC.tsv",
#     metadata_file = "../example_data/Mouse-Ear-Serum/metadata_ALL.tsv",
#     paired = FALSE
#   ),
#   output_file = paste0('lipidomics_report_Mouse-Ear_SYNC', Sys.Date(), '.html')
# )
# 
# file_path <- list.files("../example_data/Mouse-Ear-Serum",full.names = TRUE)[-7]
# file_names <- list.files("../example_data/Mouse-Ear-Serum")[-7]
# suffix <- stringr::str_extract(file_path, "_([:alnum:])*.tsv$")
# prefix <- stringr::str_extract(file_names, "([:alpha:])*_")
# file_suffix <- paste0(prefix, stringr::str_replace(suffix, ".tsv", replacement = ""))
# 
# create_report <- function(file, suffix){
#   rmarkdown::render(
#     "R/orbitrap_processing.Rmd", 
#     params = list(
#       input_file = file,
#       metadata_file = "../example_data/Mouse-Ear-Serum/metadata_ALL.tsv",
#       paired = FALSE
#     ),
#     output_file = paste0('output/lipidomics_report', suffix, "_", Sys.Date(), '.html')
#   )
# }
# 
# #for (i in 3:length(file_path)){
# for (i in 3){
#   #print(i)
#   create_report(file_path[i], file_suffix[i])
# }

# this fails because there is an extra line of column names
#create_report(files[2], file_suffix[2])
