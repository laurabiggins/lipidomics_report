---
title: Lipidomics report
date: "2021-12-01"
output: 
  html_document:
    keep_md: true
    self_contained: yes
output_file: lip
params:
  #metadata_file: D:/projects/lipidomics/example_data/liver/metadata.txt
  #input_file: D:/projects/lipidomics/example_data/liver/Liver1.tsv
  metadata_file: ../data/metadata.txt
  input_file: ../data/alldata.lipidomics_summary_test_data.tsv
  #input_file: D:/projects/lipidomics/example_data/CSC/datasets/alldata.lipidomics_summary_MiaPaca2_Parental-CSC.csv
  #metadata_file: D:/projects/lipidomics/example_data/CSC/metadata_4_reps.txt
  meta_sample_name: SampleName
  meta_condition_type: Type
  meta_rep: Rep
  paired: TRUE
  #paired: FALSE
  quick_test: FALSE
  output_folder: out
  bar_class_ylabel: value
  control: Control
  #control:	Young
  #bar_class_ylabel: area ratio

---

<p style="font-size: 11px; font-weight: bold";>
This report is primarily for explorative purposes and should not be used to draw any definitive conclusions about the data. Such conclusions should be drawn from rigorous statistical analyses in collaboration, if needed, with a biostatistician.  
</p>
<p style="font-size: 11px;";>
Statistical tests have been performed to help identify potentially interesting changes in the data. It should be noted that these tests are automated and assumptions have been made that may not be strictly correct depending on the behaviour of the data. For example, lipid data tend to be log-normal so, prior to statistical analyses, the data were log transformed to meet the assumptions of parametric tests. However, such transformation may not be suitable for all classes/species.  
</p>
<p style="font-size: 11px; font-weight: bold";>
In no case, should the statistical results from the report be used in publications without further checks on the data.  
</p>


















# {.tabset .tabset-pills}

## 1. Summary





<hr class="style2">  

### Summary plots   
A range of plots are shown below to help get an overall idea of how the data is behaving. Many of these plots show the same data but presented in slightly different ways.   
Scroll down to view all of the plots or click on the links below to navigate directly to 
a plot type.

<a href="#pie-charts">Pie charts</a><br>
<a href="#box-and-whisker">Box and whisker plots</a><br>
<a href="#forest-plots-for-log2-ratios">Forest plots</a><br>
<a href="#volcano-plot">Volcano plot</a><br>
<a href="#heatmaps">Heatmaps</a><br>

<hr> 

### Pie charts   
#### Summary of total amounts across all samples   

The pie charts show the proportion of lipid types in the samples. Any that comprised
< 1% of the total amount were grouped into an "other" category for the pie charts.
The full set and values can be found in the table below.  
The plots and table show total summed values across all replicates.



<img src="out/figures/main_pie_charts-1.png" width="50%" /><img src="out/figures/main_pie_charts-2.png" width="50%" />

  








### Total amounts

```{=html}
<div id="htmlwidget-b1a38ddc6c3a4d647d35" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-b1a38ddc6c3a4d647d35">{"x":{"filter":"none","data":[["PC","SM"],[700.758660646907,170.536296574787],[405.645900445663,72.7048557547406],[80.4272600040545,19.5727399959455],[84.8009322004121,15.1990677995879]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>class<\/th>\n      <th>sum_total_Control<\/th>\n      <th>sum_total_KO<\/th>\n      <th>percent_Control<\/th>\n      <th>percent_KO<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":10,"dom":"tlip","columnDefs":[{"targets":1,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 2, 3, \",\", \".\");\n  }"},{"targets":2,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 2, 3, \",\", \".\");\n  }"},{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 2, 3, \",\", \".\");\n  }"},{"targets":4,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 2, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[1,2,3,4]}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render","options.columnDefs.2.render","options.columnDefs.3.render"],"jsHooks":[]}</script>
```



<br>
<hr>
<br>

### Box and Whisker    
#### Linear values
  
The box-and-whisker plots show 5 point summary statistics for the lipid class: the median, upper and lower quartile (box) and min/max values (whiskers). Points beyond whisker limits are outliers. 

Each data point for the class is overlaid in the corresponding colour.

![](out/figures/boxplot_linear-1.png)<!-- -->
<br>

#### Log2 transformed values  

These plots share the same features as those above, but show the log2 transformed data.

T-tests were performed on log2 transformed data. Classes are annotated with a star if there was a significant difference between the conditions (adjusted p-value < 0.05).

![](out/figures/boxplot_totals-1.png)<!-- -->
<br>
<br>

### Forest plots for Log2 ratios 
#### KO / Control

The red point shows the ratio while the lines show the confidence interval. If the confidence interval does not span 0, the difference between the 2 conditions is likely to be significant.
Red points to the left of the line indicate higher average levels of the lipid class in the Control condition, while points to the right of the line indicate higher average levels in the KO condition.

![](out/figures/forest_class-1.png)<!-- -->




<br>
<hr class="style2">  
<br>
  
###  Volcano plot

<div class = "row">
<div class = "col-md-4">
<br><br>
The y axis shows the –log10(padj); that is the negative of the log-transformed p-values, 
adjusted for multiple comparisons.  
The x axis shows the magnitude of difference between the conditions for that lipid, 
expressed as a ratio.  
Any points to the left of the grey dashed line have higher values in Control compared to KO, and vice versa for points to the right of the grey line.  

Each point on the plot is a lipid subclass.   
Hover over a point to see the name.

The dashed red line shows significance (adj p<0.05) i.e. any points above it represent 
a significant difference between the 2 conditions.


</div>
<div class = "col-md-8">

```{=html}
<div id="htmlwidget-46165409a8f29c52ef89" style="width:576px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-46165409a8f29c52ef89">{"x":{"data":[{"x":[-0.656896390899359,-0.405292957820185,-0.229361589057011,-0.973583205795007,-0.475172340368023,-0.280556772084874,-0.958398901596409,-0.600077309209816,-0.557484517291845,-0.826462055118214,-1.0822232260362,-0.808907428072858,-1.02888401032617,-1.54654248707723,-1.17754282972736,0.310303388447235,10.7388379227863,-1.1354938255071,-1.78460263716796,-1.44440004026545,-0.247433108628318,-1.08301407380046,-0.181909311676682,-1.00182900397183,-1.40022184373,-1.07838699923557,-0.859491231269879,-0.868549627024453,1.14219045974154,-0.252229916821541,-0.698787197621578,-1.33086449389441,0.348684006692479,-1.03237219806407,-0.442839231624515,-1.375076951359,-0.327428154255462,-0.063084011730369],"y":[1.6345120151091,0.860048986721835,0.469567436117396,1.93829626578176,1.12036551986926,0.594027896143973,0.155966842779759,1.29573505963644,1.18540874887377,1.70620523976418,1.15668934250038,1.62193873536195,1.93829626578176,2.26399072173833,1.98953043020361,0.507658746745026,3.02792064597829,1.93829626578176,2.35203054163703,1.93829626578176,0.179908058730021,0.507614428720404,0.315310719033603,1.90464796604319,2.03479829897409,1.93829626578176,1.6345120151091,1.70373712054251,1.93829626578176,0.422661417480258,1.42417535953024,1.93829626578176,0.594267308764095,1.90214346758662,0.230999993219449,1.93829626578176,0.47186090867119,0.108462542327436],"text":["lipid_name: PC 26:0","lipid_name: PC 28:0","lipid_name: PC 28:1","lipid_name: PC 30:0","lipid_name: PC 30:1","lipid_name: PC 30:2","lipid_name: PC 30:3","lipid_name: PC 32:1","lipid_name: PC 32:2","lipid_name: PC 32:3","lipid_name: PC 32:4","lipid_name: PC 34:1","lipid_name: PC 34:2","lipid_name: PC 34:3","lipid_name: PC 34:4","lipid_name: PC 34:5","lipid_name: PC 36:1","lipid_name: PC 36:2","lipid_name: PC 36:3","lipid_name: PC 36:4","lipid_name: PC 36:5","lipid_name: PC 36:6","lipid_name: PC 38:2","lipid_name: PC 38:3","lipid_name: PC 38:4","lipid_name: PC 38:5","lipid_name: PC 38:6","lipid_name: PC 38:7","lipid_name: PC 40:2","lipid_name: PC 40:3","lipid_name: PC 40:4","lipid_name: PC 40:5","lipid_name: PC 40:6","lipid_name: PC 40:7","lipid_name: PC 42:4","lipid_name: PC 42:5","lipid_name: PC 42:6","lipid_name: PC 42:7"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(248,118,109,1)"}},"hoveron":"points","name":"glycerophospholipids","legendgroup":"glycerophospholipids","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[-1.17990573731195,-0.564254857138065,-1.19063715804068,-0.987062566744288,0.0615363351376449,0.253576878162301,-1.64220776279712,-0.448182722050146,-0.615844762816543,-0.474894558296047,-1.80930744145292,-2.67522648811159,-2.87478056844626,-3.00134879668034],"y":[1.90464796604319,0.153662887870195,2.00271071889698,1.90464796604319,0.140308483744062,0.59692587532889,0.502412230143163,0.956337276112925,1.56978668547245,0.835977783349846,2.35203054163703,2.93666664104825,3.02792064597829,3.02792064597829],"text":["lipid_name: SM 14:0","lipid_name: SM 14:1","lipid_name: SM 16:0","lipid_name: SM 16:1","lipid_name: SM 18:0","lipid_name: SM 18:1","lipid_name: SM 18:2","lipid_name: SM 20:0","lipid_name: SM 20:1","lipid_name: SM 22:0","lipid_name: SM 22:1","lipid_name: SM 22:2","lipid_name: SM 24:2","lipid_name: SM 24:3"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,191,196,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,191,196,1)"}},"hoveron":"points","name":"sphingolipids","legendgroup":"sphingolipids","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[-3.68835813265367,11.4258472587596],"y":[1.30102999566398,1.30102999566398],"text":"","type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(255,0,0,1)","dash":"dash"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,0],"y":[-0.0375103628551074,3.17389355116084],"text":"","type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(190,190,190,1)","dash":"dash"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":24.7671232876712,"r":7.30593607305936,"b":38.7214611872146,"l":31.4155251141553},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-3.68835813265367,11.4258472587596],"tickmode":"array","ticktext":["0","4","8"],"tickvals":[0,4,8],"categoryorder":"array","categoryarray":["0","4","8"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"ratio","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.0375103628551074,3.17389355116084],"tickmode":"array","ticktext":["0","1","2","3"],"tickvals":[0,1,2,3],"categoryorder":"array","categoryarray":["0","1","2","3"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"-log10(padj)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":1},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"1b5c32522aa":{"x":{},"y":{},"colour":{},"annotation":{},"type":"scatter"},"1b5c413d12b3":{"yintercept":{}},"1b5c1319d6e":{"xintercept":{}}},"cur_data":"1b5c32522aa","visdat":{"1b5c32522aa":["function (y) ","x"],"1b5c413d12b3":["function (y) ","x"],"1b5c1319d6e":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```
</div>
</div>

<br>
<br>
<hr class="style2">  
<br>
<br>

### Heatmaps

These heatmaps show log2 transformed data and are scaled by row, to allow comparison between samples.  
<br>
<br>

#### Lipids that change between conditions

This heatmap shows lipids with an adjusted p value < 0.05 from t-tests. 
Row labels are shown if there are < 70 rows. 

<p style="font-size: 11px;";>
Rows and columns have been clustered using default clustering methods in the pheatmap R package.
</p>







![](out/figures/heatmap1-1.png)<!-- -->


<br><br>

#### All lipids  
Rows ordered by lipid subclass, columns ordered by condition, no clustering.

![](out/figures/heatmap1-16-1.png)<!-- -->


## 2. Class plots  
  
This page shows 2 plots per lipid class; these show the lipid subclasses within each class.

### Box plot information
The box-and-whisker plots show 5 point summary statistics for the lipid subclasses: the median, upper and lower quartile (box) and min/max values (whiskers). Points beyond whisker limits are outliers.  
Each data point for the class is overlaid in the corresponding colour.
   
### Forest plot information    
The plots on the right show log2 ratios between the 2 conditions, the red point 
shows the ratio while the lines show the confidence interval. If the confidence 
interval does not span over 0, the difference between the 2 conditions for that 
particular species is likely to be significant.    
Subclasses that did not fit the assumptions for two-sample t-tests may not be shown in these plots.  
  
Scroll down to view all of the lipid classes or select the blue links below to jump directly to a class.  


  
#### <a href="#pc">PC</a>, <a href="#sm">SM</a>
   

### PC  
  
<br>









<img src="out/figures//PC-box_forest-1.png" width="50%" /><img src="out/figures//PC-box_forest-2.png" width="50%" />

<br>  

### SM  
  
<br>









<img src="out/figures//SM-box_forest-23-1.png" width="50%" /><img src="out/figures//SM-box_forest-23-2.png" width="50%" />

<br>  

## 3. Individual lipids  

This page shows individual data points for each lipid subclass. 

#### Scroll down to browse plots for individual lipids or click on the name in the table below to navigate directly to the plot.


```{=html}
<div id="htmlwidget-49a167d87401de58b32f" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-49a167d87401de58b32f">{"x":{"filter":"top","filterHTML":"<tr>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.000955766666666\" data-max=\"0.779\" data-scale=\"15\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"-8.34935892591474\" data-max=\"4.4992013384139\" data-scale=\"15\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"-9.03607151798293\" data-max=\"3.8664136728704\" data-scale=\"15\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"-4.91883667900644\" data-max=\"10.7388379227863\" data-scale=\"15\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","data":[["PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","PC","SM","SM","SM","SM","SM","SM","SM","SM","SM","SM","SM","SM","SM","SM","PC","SM","SM","SM","SM","SM"],["<a href=\"#pc-260\">PC 26:0<\/a>","<a href=\"#pc-280\">PC 28:0<\/a>","<a href=\"#pc-281\">PC 28:1<\/a>","<a href=\"#pc-300\">PC 30:0<\/a>","<a href=\"#pc-301\">PC 30:1<\/a>","<a href=\"#pc-302\">PC 30:2<\/a>","<a href=\"#pc-303\">PC 30:3<\/a>","<a href=\"#pc-321\">PC 32:1<\/a>","<a href=\"#pc-322\">PC 32:2<\/a>","<a href=\"#pc-323\">PC 32:3<\/a>","<a href=\"#pc-324\">PC 32:4<\/a>","<a href=\"#pc-341\">PC 34:1<\/a>","<a href=\"#pc-342\">PC 34:2<\/a>","<a href=\"#pc-343\">PC 34:3<\/a>","<a href=\"#pc-344\">PC 34:4<\/a>","<a href=\"#pc-345\">PC 34:5<\/a>","<a href=\"#pc-361\">PC 36:1<\/a>","<a href=\"#pc-362\">PC 36:2<\/a>","<a href=\"#pc-363\">PC 36:3<\/a>","<a href=\"#pc-364\">PC 36:4<\/a>","<a href=\"#pc-365\">PC 36:5<\/a>","<a href=\"#pc-366\">PC 36:6<\/a>","<a href=\"#pc-381\">PC 38:1<\/a>","<a href=\"#pc-382\">PC 38:2<\/a>","<a href=\"#pc-383\">PC 38:3<\/a>","<a href=\"#pc-384\">PC 38:4<\/a>","<a href=\"#pc-385\">PC 38:5<\/a>","<a href=\"#pc-386\">PC 38:6<\/a>","<a href=\"#pc-387\">PC 38:7<\/a>","<a href=\"#pc-402\">PC 40:2<\/a>","<a href=\"#pc-403\">PC 40:3<\/a>","<a href=\"#pc-404\">PC 40:4<\/a>","<a href=\"#pc-405\">PC 40:5<\/a>","<a href=\"#pc-406\">PC 40:6<\/a>","<a href=\"#pc-407\">PC 40:7<\/a>","<a href=\"#pc-424\">PC 42:4<\/a>","<a href=\"#pc-425\">PC 42:5<\/a>","<a href=\"#pc-426\">PC 42:6<\/a>","<a href=\"#pc-427\">PC 42:7<\/a>","<a href=\"#sm-140\">SM 14:0<\/a>","<a href=\"#sm-141\">SM 14:1<\/a>","<a href=\"#sm-160\">SM 16:0<\/a>","<a href=\"#sm-161\">SM 16:1<\/a>","<a href=\"#sm-180\">SM 18:0<\/a>","<a href=\"#sm-181\">SM 18:1<\/a>","<a href=\"#sm-182\">SM 18:2<\/a>","<a href=\"#sm-200\">SM 20:0<\/a>","<a href=\"#sm-201\">SM 20:1<\/a>","<a href=\"#sm-220\">SM 22:0<\/a>","<a href=\"#sm-221\">SM 22:1<\/a>","<a href=\"#sm-222\">SM 22:2<\/a>","<a href=\"#sm-242\">SM 24:2<\/a>","<a href=\"#sm-243\">SM 24:3<\/a>","<a href=\"#pc-320\">PC 32:0<\/a>","<a href=\"#sm-120\">SM 12:0<\/a>","<a href=\"#sm-162\">SM 16:2<\/a>","<a href=\"#sm-202\">SM 20:2<\/a>","<a href=\"#sm-241\">SM 24:1<\/a>","<a href=\"#sm-244\">SM 24:4<\/a>"],["paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","one_sample_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_t_test","paired_none","paired_none","paired_none","paired_none","paired_none","paired_none"],[0.0227703703703704,0.136769444444444,0.338022222222222,0.01113,0.0749794117647059,0.253075,0.69748,0.0499225806451613,0.064428125,0.0192125,0.0689,0.0234714285714286,0.01113,0.00554985714285714,0.00949181818181818,0.308951219512195,0.000955766666666667,0.01113,0.0045315,0.01113,0.659795918367347,0.309166666666667,0.00761875,0.48263829787234,0.0121177272727273,0.00836222222222222,0.01113,0.0227703703703704,0.0193556,0.01113,0.376760869565217,0.0371,0.0109091666666667,0.252769230769231,0.0122130434782609,0.5863125,0.01113,0.336068181818182,0.779,0.0121177272727273,0.701470588235294,0.009116,0.0121177272727273,0.723653846153846,0.251052631578947,0.31306976744186,0.109482857142857,0.0265,0.144675675675676,0.0045315,0.00117925,0.000955766666666667,0.000955766666666667,null,null,null,null,null,null],[-4.96233210280336,-0.555281772731563,-3.97244803125738,2.16032939663195,1.09259885691365,-3.25395456361513,-6.44301126197812,4.46649098208021,2.03853855135046,-2.32167449208162,-6.72485884168209,4.4992013384139,3.77817150834466,1.11198900880369,-2.76033430748759,-6.52206793236552,-8.34935892591474,3.72941666054695,2.92535991185391,0.939535720364281,-1.3612500577653,-3.22601772925994,0,-0.190602690916203,1.53553272236371,1.77385182704672,0.239362898964462,0.286091481566167,-2.38245265811763,-3.14874267181236,-2.87746990438782,-1.64746672478175,-1.46827238866019,-1.25813677814201,-0.429588573044195,-3.374357962216,-4.02029272826231,-4.37345420182182,-3.86631855466763,1.15301021255232,-3.51518120700246,3.84136373375995,0.511058711604916,-0.106210464986228,-2.16766054137601,-6.5014255189083,-0.899549283725114,-3.00152654609585,0.616526938600462,0.256233042501917,-4.2429343533594,-0.160768579582506,-4.22316353047303,2.7942140216123,-2.78630918056421,-3.93688367559699,-4.11723483897649,1.94172683912699,-6.1443230985399],[-5.61922849370272,-0.960574730551748,-4.20180962031439,1.18674619083695,0.617426516545622,-3.5345113357,-7.40141016357453,3.8664136728704,1.48105403405862,-3.14813654719983,-7.80708206771829,3.69029391034104,2.74928749801849,-0.434553478273544,-3.93787713721495,-6.21176454391828,2.38947899687152,2.59392283503984,1.14075727468595,-0.504864319901166,-1.60868316639361,-4.3090318030604,-1.81209993973392,-0.372512002592885,0.533703718391877,0.373629983316712,-0.839024100271107,-0.573399749703712,-3.25100228514208,-2.00655221207082,-3.12969982120936,-2.34625392240333,-2.7991368825546,-0.909452771449526,-1.46196077110826,-3.81719719384051,-5.39536967962131,-4.70088235607728,-3.929402566398,-0.0268955247596376,-4.07943606414053,2.65072657571927,-0.476003855139372,-0.0446741298485831,-1.91408366321371,-8.14363328170542,-1.34773200577526,-3.61737130891239,0.141632380304415,-1.55307439895101,-6.91816084147098,-3.03554914802877,-7.22451232715337,-0.815325219622187,-2.56837471742983,-8.18745196058732,-9.03607151798293,-0.416140945979902,0],[-0.656896390899359,-0.405292957820185,-0.229361589057011,-0.973583205795007,-0.475172340368023,-0.280556772084874,-0.958398901596409,-0.600077309209816,-0.557484517291845,-0.826462055118214,-1.0822232260362,-0.808907428072858,-1.02888401032617,-1.54654248707723,-1.17754282972736,0.310303388447235,10.7388379227863,-1.1354938255071,-1.78460263716796,-1.44440004026545,-0.247433108628318,-1.08301407380046,-1.81209993973392,-0.181909311676682,-1.00182900397183,-1.40022184373,-1.07838699923557,-0.859491231269879,-0.868549627024453,1.14219045974154,-0.252229916821541,-0.698787197621578,-1.33086449389441,0.348684006692479,-1.03237219806407,-0.442839231624515,-1.375076951359,-0.327428154255462,-0.063084011730369,-1.17990573731195,-0.564254857138065,-1.19063715804068,-0.987062566744288,0.0615363351376449,0.253576878162301,-1.64220776279712,-0.448182722050146,-0.615844762816543,-0.474894558296047,-1.80930744145292,-2.67522648811159,-2.87478056844626,-3.00134879668034,-3.60953924123449,0.217934463134386,-4.25056828499032,-4.91883667900644,-2.35786778510689,6.1443230985399]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>class<\/th>\n      <th>lipid_name<\/th>\n      <th>test_type<\/th>\n      <th>adj_pval<\/th>\n      <th>log2_mean_Control<\/th>\n      <th>log2_mean_KO<\/th>\n      <th>log2_fc<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":10,"dom":"tlip","columnDefs":[{"targets":3,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 5, 3, \",\", \".\");\n  }"},{"targets":4,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 3, 3, \",\", \".\");\n  }"},{"targets":5,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 3, 3, \",\", \".\");\n  }"},{"targets":6,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 3, 3, \",\", \".\");\n  }"},{"className":"dt-right","targets":[3,4,5,6]}],"order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true}},"evals":["options.columnDefs.0.render","options.columnDefs.1.render","options.columnDefs.2.render","options.columnDefs.3.render"],"jsHooks":[]}</script>
```




### PC 26:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-26-0-individual_plot-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0227704 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0115</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 28:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-28-0-individual_plot-31-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.1367694 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0929</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 28:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-28-1-individual_plot-38-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.3380222 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.287</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 30:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-30-0-individual_plot-45-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00355</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 30:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-30-1-individual_plot-52-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0749794 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0481</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 30:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-30-2-individual_plot-59-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.253075 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.191</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 30:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-30-3-individual_plot-66-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.69748 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.658</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 32:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-32-0-individual_plot-73-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: none
#### p-value (corrected) : NA 

<span style='font-size: 12px;'>p-value (uncorrected) : NA</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.</span>

</div>
</div>



### PC 32:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-32-1-individual_plot-80-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0499226 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0292</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 32:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-32-2-individual_plot-87-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0644281 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0389</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 32:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-32-3-individual_plot-94-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0192125 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0087</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 32:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-32-4-individual_plot-101-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0689 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0429</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 34:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-34-1-individual_plot-108-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0234714 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0124</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 34:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-34-2-individual_plot-115-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00399</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 34:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-34-3-individual_plot-122-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0055499 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.000733</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 34:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-34-4-individual_plot-129-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0094918 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00197</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 34:5








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-34-5-individual_plot-136-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.3089512 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.239</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 36:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-36-1-individual_plot-143-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 9.5576667\times 10^{-4} 

<span style='font-size: 12px;'>p-value (uncorrected) : 3.25e-05</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 36:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-36-2-individual_plot-150-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00394</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 36:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-36-3-individual_plot-157-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0045315 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.000494</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 36:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-36-4-individual_plot-164-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00337</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 36:5








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-36-5-individual_plot-171-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.6597959 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.61</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 36:6








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-36-6-individual_plot-178-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.3091667 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.245</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 38:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-1-individual_plot-185-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: One sample t-test
#### p-value (corrected) : 0.0076187 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00115</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a two sample t-test. One of the conditions had almost all 0 values, so a one-sample t-test was performed for the other condition. The results of this test may not be very robust and the plot should be viewed carefully to understand the data.</span>

</div>
</div>



### PC 38:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-2-individual_plot-192-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.4826383 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.428</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 38:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-3-individual_plot-199-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0121177 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00499</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 38:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-4-individual_plot-206-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0083622 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00142</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 38:5








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-5-individual_plot-213-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00375</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 38:6








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-6-individual_plot-220-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0227704 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0116</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 38:7








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-38-7-individual_plot-227-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0193556 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00913</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 40:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-40-2-individual_plot-234-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0039</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 40:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-40-3-individual_plot-241-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.3767609 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.327</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 40:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-40-4-individual_plot-248-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0371 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.021</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 40:5








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-40-5-individual_plot-255-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0109092 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00247</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 40:6








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-40-6-individual_plot-262-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.2527692 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.186</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 40:7








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-40-7-individual_plot-269-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.012213 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0053</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 42:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-42-4-individual_plot-276-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.5863125 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.531</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 42:5








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-42-5-individual_plot-283-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.01113 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00342</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 42:6








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-42-6-individual_plot-290-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.3360682 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.279</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### PC 42:7








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/PC-42-7-individual_plot-297-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.779 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.779</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 12:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-12-0-individual_plot-304-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: none
#### p-value (corrected) : NA 

<span style='font-size: 12px;'>p-value (uncorrected) : NA</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.</span>

</div>
</div>



### SM 14:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-14-0-individual_plot-311-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0121177 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00492</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 14:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-14-1-individual_plot-318-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.7014706 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.675</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 16:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-16-0-individual_plot-325-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.009116 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00172</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 16:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-16-1-individual_plot-332-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0121177 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.00503</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 16:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-16-2-individual_plot-339-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: none
#### p-value (corrected) : NA 

<span style='font-size: 12px;'>p-value (uncorrected) : NA</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.</span>

</div>
</div>



### SM 18:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-18-0-individual_plot-346-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.7236538 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.71</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 18:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-18-1-individual_plot-353-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.2510526 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.18</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 18:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-18-2-individual_plot-360-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.3130698 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.254</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 20:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-20-0-individual_plot-367-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.1094829 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0723</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 20:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-20-1-individual_plot-374-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0265 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.0145</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 20:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-20-2-individual_plot-381-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: none
#### p-value (corrected) : NA 

<span style='font-size: 12px;'>p-value (uncorrected) : NA</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.</span>

</div>
</div>



### SM 22:0








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-22-0-individual_plot-388-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.1446757 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.101</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 22:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-22-1-individual_plot-395-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0045315 

<span style='font-size: 12px;'>p-value (uncorrected) : 0.000513</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 22:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-22-2-individual_plot-402-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 0.0011792 

<span style='font-size: 12px;'>p-value (uncorrected) : 8.9e-05</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 24:1








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-24-1-individual_plot-409-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: none
#### p-value (corrected) : NA 

<span style='font-size: 12px;'>p-value (uncorrected) : NA</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.</span>

</div>
</div>



### SM 24:2








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-24-2-individual_plot-416-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 9.5576667\times 10^{-4} 

<span style='font-size: 12px;'>p-value (uncorrected) : 5.41e-05</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 24:3








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-24-3-individual_plot-423-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: Paired t-test
#### p-value (corrected) : 9.5576667\times 10^{-4} 

<span style='font-size: 12px;'>p-value (uncorrected) : 4.28e-05</span>
<br><br><br>

<span style='font-size: 12px;'>Paired t-test performed on log2 transformed data. The samples were paired/matched.</span>

</div>
</div>



### SM 24:4








<div class = "row">
<div class = "col-md-6">
![](out/figures/individual_lipid_plots/SM-24-4-individual_plot-430-1.png)<!-- -->
</div>

<div class = "col-md-1">
</div>
<div class = "col-md-5">
<br>
<br>  



#### Test performed: none
#### p-value (corrected) : NA 

<span style='font-size: 12px;'>p-value (uncorrected) : NA</span>
<br><br><br>

<span style='font-size: 12px;'>The data did not meet the criteria for performing a statistical test. There may have been too few non-zero values or the variance of a condition may have been too high.</span>

</div>
</div>
  
## 4. Experimental info



### Experimental design

This report has been generated on the assumption that the type of experiment carried out was
**a matched design**.    
   
We have considered 2 types of experimental designs which we called independent and matched respectively. They are defined as follows: 

**Independent design:** 2 or more conditions (e.g. genotype, treatment …) and in each several independent biological replicates (e.g. mouse, human …). 

**Matched design:** aka repeated, dependent or paired. For this type of design we have considered 2 possibilities: 

- Design1: Two or more measures per animal/subject/petri dish (e.g. before/after treatment measures). 

- Design 2: Two or more independent experiments and within each experiment: same conditions (e.g. in each experiment 1 WT and 1 KO mice, the 2 animals are considered matched). 

<br>

### Metadata supplied for the experiment

<div class = "row">
<div class = "col-md-6">

```{=html}
<div id="htmlwidget-86c373427be004006edc" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-86c373427be004006edc">{"x":{"filter":"none","data":[["S1_1","S1_2","S1_3","S1_4","S1_5","S1_6","S2_1","S2_2","S2_3","S2_4","S2_5","S2_6"],["Control","Control","Control","Control","Control","Control","KO","KO","KO","KO","KO","KO"],["1","2","3","4","5","6","1","2","3","4","5","6"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>sample_name<\/th>\n      <th>condition<\/th>\n      <th>rep<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":15,"dom":"tp","order":[],"autoWidth":false,"orderClasses":false,"lengthMenu":[10,15,25,50,100]}},"evals":[],"jsHooks":[]}</script>
```
</div>
</div>
<br>
   
### QQ plots of all data  
  
0 values have been removed.  

<img src="out/figures/qqplots-1.png" width="50%" /><img src="out/figures/qqplots-2.png" width="50%" />
