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
create_report <- function(data_file, metadata_file, outfile_name, control, matched = FALSE,
                          output_fullpath_supplied = FALSE, quick_test = FALSE, meta_condition_type= "Type", 
                          bar_class_ylabel = ""){
  
  assertthat::assert_that(nchar(outfile_name) > 1, msg = "outfile name must be supplied")
  assertthat::assert_that(nchar(control) > 1, msg = "Name of control condition must be supplied")
  assertthat::assert_that(
    file.exists(data_file), 
    msg = paste0("data file not found, file name supplied = ", data_file)
  )
  assertthat::assert_that(
    file.exists(metadata_file), 
    msg = paste0("metadata file not found, file name supplied = ", metadata_file)
  )
  assertthat::assert_that(
    is.logical(matched),
    msg = paste0("matched_samples option must be TRUE or FALSE, value found = ", matched_samples)
  )
  assertthat::assert_that(
    is.logical(quick_test),
    msg = paste0("quick_test option must be TRUE or FALSE, value found = ", matched_samples)
  )
  assertthat::assert_that(
    is.character(bar_class_ylabel),
    msg = paste0("bar_class_ylabel option must a piece of text surrounded by quotes, value found = ", matched_samples)
  )
  
   
  if(output_fullpath_supplied) {
    out_file <- outfile_name
  } else {
    output_location <- paste0(dirname(data_file), "/output")
    if(! dir.exists(output_location)) dir.create(output_location)
    out_file <- paste0(output_location, "/", outfile_name)
  }
  
  out_file <- paste0(out_file, "_", Sys.Date(), '.html') 
  
  #meta_info <- process_metadata(metadata_file = metadata_file, control = control)
  
  rmarkdown::render(
    "R/orbitrap_processing.Rmd",
    params = list(
      input_file = data_file,
      metadata_file = metadata_file,
     # meta_info = meta_info,
      paired = matched,
      quick_test = quick_test,
      output_folder = output_location,
      bar_class_ylabel = bar_class_ylabel,
      control = control
    ),
    output_file = out_file
  )
}


#' process_metadata
#' 
#' Checking the metadata is as expected
#'
#' @param control name of the "control" condition
#' @param metadata_file 
#' @param meta_condition_type column name of metadata file that contains the conditions
#' @param meta_sample_name column name of metadata file that contains the sample names
#'
#' @return tibble containing the processed metadata
#' @export
#'
#' @examples
process_metadata <- function(metadata_file, control, meta_condition_type = "Type", 
                             meta_sample_name = "SampleName"){

  metadata <- switch(tools::file_ext(metadata_file), 
                          tsv = ,
                          txt = readr::read_tsv(metadata_file),
                          csv = readr::read_csv(metadata_file),
                          stop("Unknown file extension on metadata file")
  )
  assertthat::assert_that(
    meta_condition_type %in% colnames(metadata),
    msg = paste0("Condition type column ", meta_condition_type, " not found in metadata file.")
  )
  assertthat::assert_that(
    meta_sample_name %in% colnames(metadata), 
    msg = paste0("Sample name column ", meta_sample_name, " not found in metadata file.")
  )
  assertthat::assert_that(
    control %in% metadata[[meta_condition_type]], 
    msg = paste0("control condition ", control, " not found in metadata file.")
  )
  meta_info <- metadata %>%
    dplyr::rename(sample_name = tidyselect::all_of(meta_sample_name)) %>%
    dplyr::rename(condition = tidyselect::all_of(meta_condition_type)) %>%
    dplyr::mutate(condition = stringr::str_squish(condition))
  
  meta_info
}

#' name_wrapper
#' helper function for creating tibble of superclasses
#'
#' @param vector_name 
#' @param char_vec 
#'
#' @return
#'
#' @examples
name_wrapper <- function(vector_name, char_vec){
  setNames(char_vec, rep(vector_name, length(char_vec)))
}

superclasses <- tibble::enframe(
  c(
    name_wrapper(
      "glycerophospholipids", 
      c('PC', 'PE', 'PS', 'PI', 'PA', 'PG', 'CL')
    ),
    name_wrapper(
      "lysolipids", 
      c('LPA', 'LPC', 'LPE', 'LPG', 'LPI', 'LPS')
    ),
    name_wrapper(
      "sphingolipids", 
      c('SG', 'dhSG', 'SM', 'dhSM', 'dhCer', 'Cer', 'Glu-Cer', 'Hex-Cer', 'Lac-Cer', 'Gal-Cer', 'S1P')
    ),
    name_wrapper(
      "ether_lipids",
      c('O-TG', 'O-DG', 'O-PC', 'O-PE', 'P-PE', 'P-PC', 'O-LPA', 'O-LPC', 'O-LPE', 'P-LPA', 'P-LPC', 'P-LPE')
    ),
    name_wrapper(
      "neutral_lipids",
      c("TG", "CE", "CH", "DG")
    ),
    name_wrapper(
      "acyl_CoA",
      c('3-HMG-CoA', 'Succinyl-CoA', 'Hydroxybutyryl-CoA', 'Butyryl-CoA', 'Propionyl-CoA', 
        'Methylmalonyl-CoA', 'Malonyl-CoA', 'Acetoacetyl-CoA', 'crotonyl-CoA', 'acetyl-CoA')
    ),
    name_wrapper(
      "fatty_acyls",
      c('FFA', 'FaCoA', 'FaCN')
    ),
    name_wrapper(
      "PIPx",
      c('PIP', 'PIP2', 'PIP3')
    )
  ), name = "superclass", value = "class"
)
