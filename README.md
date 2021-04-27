# lipidomics report

This project contains code to generate an html report for lipidomics data. It requires one data file and one metadata file. The wrapper script generate_report.R is the only code that the user should need to interact with.
To run the code and create a report, open the generate_report.R script and follow the instructions.
 <br><br> 
    
## Experimental design  
The processing and statistics will differ depending on whether the experimental design is independent or uses matched samples. See the [slides](https://github.com/laurabiggins/lipidomics_report/blob/main/info/Experimental_design_independent_vs_matched.pdf) for further information on independent vs matched design.
<br><br>    
  
## Input data
The data file must be in tab delimited format, and can be the output of an existing Orbitrap.R script (in a private repository).
The first column should contain the lipid name, and subsequent columns should contain values for each of the different samples. One row per lipid. The first column can be unnamed, but the other column names must be the sample names.  
The lipid name should be in the format "lipid class [space] subclass" e.g. "PC 26:0".
      
### Data file example 
|  | WT_1 | WT_2 | WT_3 | KO_1 | KO_2 | KO_3 |
|--|------|------|------|------|------|------|
| PC 26:0 | 0.0355 | 0.0313 | 0.0363 | 0.0240 | 0.0251 |0.0167 |
| PC 28:0 | 0.7975 | 0.6864 | 0.7319 | 0.6140 | 0.7334 |0.3899 |
| PC 28:1 | 0.0740 | 0.0629 | 0.0658 | 0.0626 | 0.0758 |0.0419 | 
  
<br><br>  

## Metadata
The metadata file should be in one of the following formats. The columns names should be identical to those below. Extra columns can be present in the metadata file, they will just be ignored. The sample names (e.g. WT_1, WT_2) must match the column names in the input data file.  
     
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

