# lipidomics_report

This project contains code to generate a report for lipidomics data.

It requires one data file and one metadata file.

The data file must be in tab delimited format, where the first column contains the lipid name. That first column can be unnamed, but the others should be the sample names.
The lipid name should be in the format "lipid class [space] subclass" e.g. "PC 26:0"

## Metadata
The metadata file should be in one of the formats with the column names as shown (extra columns can be present, they will be ignored):

#### Experimental design  
The processing and statistics will differ depending on whether the experimental design is independent or uses matched samples. See the [slides](https://github.com/laurabiggins/lipidomics_report/blob/main/info/Experimental_design_independent_vs_matched.pdf) for further information on independent vs matched design.

#### Independent/Unpaired samples

| SampleName | Type | 
| ---------- | ---- |
| S1_1       | Control |
| S1_2       | Control |
| S1_3       | Control |
| S2_1       | KO |
| S2_2       | KO |
| S2_3       | KO |

#### Matched/Paired samples

| SampleName | Type | Rep | 
| ---------- | ---- | --- |
| S1_1       | Control | 1 |
| S1_2       | Control | 2 |
| S1_3       | Control | 3 |
| S2_1       | KO | 1 |
| S2_2       | KO | 2 |
| S2_3       | KO | 3 |

