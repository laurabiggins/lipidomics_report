setwd("//fs-home/segondsa/Work/Andrea/example_lipidomics_data/example_data/Mouse-Ear-Serum")

library(tidyverse)
library(rstatix)
theme_set(theme_bw(base_size = 14))

ear.data <- read_csv("Ear_alldata.lipidomics_summary_4replicas_SYNC.csv")


 ## tidying the data ##
ear.data %>%
  pivot_longer(cols = -species, names_to = "sample_name") %>%
 separate(species, sep = " ", into = c("class", NA), remove = FALSE)%>%
  separate(sample_name, sep = "_", into = c(NA, NA, "genotype"), remove = FALSE) -> ear.data.long

## calculates the sums ##
ear.data.long %>%
  group_by(class, genotype) %>%
  summarise(total.values = sum(value)) -> ear.data.long.total

## now percents ##
ear.data.long.total %>%
  group_by(genotype) %>%
  mutate(percent = (total.values/sum(total.values))*100) -> ear.data.long.total

ear.data.long.total.sup1 %>%
  group_by(genotype) %>%
  sum(percent.sup1)


 ## add percents <1 to create a new class: other ##
ear.data.long.total %>%
  group_by(genotype) %>%
  mutate(percent.sup1 = case_when(percent<=1 ~ sum(percent[percent<=1]), percent>1 ~ percent)) %>%
  mutate(new.class = case_when(percent<=1 ~  "Other", percent>1 ~ class)) %>%
  distinct(new.class, .keep_all = TRUE)-> ear.data.long.total.sup1


## pie with ggplot ##

library(RColorBrewer)

ear.data.long.total.sup1 %>%
  ggplot(aes(x="", y=percent.sup1, fill=class))+
  geom_bar(stat="identity", colour="black") +
  coord_polar("y", start=0)+
  facet_grid(cols=vars(genotype))

## pie with core R ##

colour.seq <- length(ear.data.long.total.sup1$genotype)/2

par(mfrow=c(1,2))


pie(ear.data.long.total.sup1[ear.data.long.total.sup1$genotype == "WT",]$percent.sup1, 
    labels=ear.data.long.total.sup1[ear.data.long.total.sup1$genotype == "WT",]$new.class,
    col=rainbow(colour.seq))

pie(ear.data.long.total.sup1[ear.data.long.total.sup1$genotype == "MUT",]$percent.sup1, 
    labels=ear.data.long.total.sup1[ear.data.long.total.sup1$genotype == "MUT",]$new.class,
    col=rainbow(colour.seq))

## problem: one class missing in MUT ... ###






