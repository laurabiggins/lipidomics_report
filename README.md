# lipidomics report

This project contains code to generate an html report for lipidomics data. It requires a config file that contains various paramets required to create the report. The wrapper script lipidomics_report_wrapper.R is the only code that the user should need to interact with.
To run the code and create a report, open the lipidomics_report_wrapper.R script and follow the instructions.
<br><br> 
    
## Config file  
 
The config file can be in csv, txt or tsv format. It should look similar to the table below. The first column should not be changed, but the 2nd column should be populated with the appropriate information.  
Details of each parameter can be found in this document.

|--|--|
| [data_file_path](#data_file_path) | data/alldata.lipidomics_summary_test_data.tsv |
| [matched_samples](#matched_samples) | TRUE |
| [metadata_file](#metadata_file) | data/metadata.txt |
| [outfile](#outfile) | test_output |
| [bar_class_ylabel](#bar_class_ylabel) | ng/ng DNA |
| [control](#control) | Control |
| [test_run](#test_run) | TRUE |
  
<br>  
  
## data_file_path
File location for the main data file. 

It may be easier to provide full paths for the data_file_path to avoid confusion over relative file locations. The example config file contains relative paths so that the script will run with the test data.
    
The data file must be in tab delimited format, and can be the output of an existing Orbitrap.R script (in a private repository).
The first column should contain the lipid name, and subsequent columns should contain values for each of the different samples. One row per lipid. The first column can be unnamed, but the other column names must be the sample names.  
The lipid name should be in the format "lipid class [space] subclass" e.g. "PC 26:0".
      
### Data file example 
|  | WT_1 | WT_2 | WT_3 | KO_1 | KO_2 | KO_3 |
|--|------|------|------|------|------|------|
| PC 26:0 | 0.0355 | 0.0313 | 0.0363 | 0.0240 | 0.0251 |0.0167 |
| PC 28:0 | 0.7975 | 0.6864 | 0.7319 | 0.6140 | 0.7334 |0.3899 |
| PC 28:1 | 0.0740 | 0.0629 | 0.0658 | 0.0626 | 0.0758 |0.0419 | 
  
<br> 

## matched_samples 
A value of TRUE or FALSE is required.
TRUE if the experimental design is matched/paired.
FALSE if the experimental design is not matched/paired.

### Experimental design  
The processing and statistics will differ depending on whether the experimental design is independent or uses matched samples. See the [slides](https://github.com/laurabiggins/lipidomics_report/blob/main/info/Experimental_design_independent_vs_matched.pdf) for further information on independent vs matched design.
<br>

## metadata_file
File location for the metadata file.  

The metadata file should be in one of the following formats. The column names should be identical to those below. Extra columns can be present in the metadata file, they will just be ignored. The sample names (e.g. WT_1, WT_2) must match the column names in the input data file. The metadata files will look slightly different depending on whether they are a matched/paired design or not, see the [experimental design](#experimental-design) section for clarification. 
   
### Independent/Unpaired samples
| SampleName | Type | 
| ---------- | ---- |
| WT_1       | Control |
| WT_2       | Control |
| WT_3       | Control |
| KO_1       | KO |
| KO_2       | KO |
| KO_3       | KO |

### Matched/Paired samples  
If the experiment is a matched design, the metadata file must contain a column named "Rep", containing the replicate number.  
| SampleName | Type | Rep | 
| ---------- | ---- | --- |
| WT_1       | Control | 1 |
| WT_2       | Control | 2 |
| WT_3       | Control | 3 |
| KO_1       | KO | 1 |
| KO_2       | KO | 2 |
| KO_3       | KO | 3 |

<br>

## outfile  
Name of the output file. The date will be appended to this file name.  

## bar_class_ylabel
 

## control
 

## test_run
 



