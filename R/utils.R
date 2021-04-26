#' create_report
#' 
#' wrapper function around the Rmarkdown document orbitrap_processing.Rmd
#'
#' @param data_file The data file must be in tab delimited format, and can be the output of an existing Orbitrap.R script (in a private repository). The first column should contain the lipid name, and subsequent columns should contain values for each of the different samples. One row per lipid. The first column can be unnamed, but the other column names must be the sample names. 
#' The lipid name should be in the format "lipid class [space] subclass" e.g. "PC 26:0".
#' @param metadata_file metadata file as shown in https://github.com/laurabiggins/lipidomics_report 
#' @param outfile_name name of output file
#' @param matched_samples TRUE or FALSE, whether it is a paired/matched design
#' @param output_fullpath_supplied TRUE or FALSE, the entire file path for the 
#' output file can be supplied in the outfile_name parameter. If it is not, a directory
#' named "output" will be created in the directory containing the data_file.
#'
#' @return
#' @export
#'
#' @examples
create_report <- function(data_file, metadata_file, outfile_name, matched = FALSE,
                          output_fullpath_supplied = FALSE){
  
  assertthat::assert_that(file.exists(data_file), msg = paste0("data file not found, file name supplied = ", data_file))
  assertthat::assert_that(file.exists(metadata_file), msg = paste0("metadata file not found, file name supplied = ", metadata_file))
  assertthat::assert_that(nchar(outfile_name) > 1, msg = "outfile name must be supplied") 
  assertthat::assert_that(
    is.logical(matched),
    msg = paste0("matched_samples option must be TRUE or FALSE, value found = ", matched_samples)
  )
 
  
  if(output_fullpath_supplied) {
    out_file <- outfile_name
  } else {
    output_location <- paste0(dirname(data_file), "/output")
    if(! dir.exists(output_location)) dir.create(output_location)
    out_file <- paste0(output_location, "/", outfile_name)
  }
  
  out_file <- paste0(out_file, "_", Sys.Date(), '.html') 
  
  rmarkdown::render(
    "R/orbitrap_processing.Rmd",
    params = list(
      input_file = data_file,
      metadata_file = metadata_file,
      paired = matched
    ),
    output_file = out_file
  )
}
