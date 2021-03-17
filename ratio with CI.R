setwd("//fs-home/segondsa/Work/Andrea")

library(mratios)

ratio.test <-read.csv("ratio t test example.csv")

ttestratio(ratio.test$group1, ratio.test$group2, alternative="two.sided")


