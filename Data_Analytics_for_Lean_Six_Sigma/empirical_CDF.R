# Title     : Empirical CDF
# Objective : Determine percentage of cases meet your specifications
# Created by: oscarhernandezlopez
# Created on: 26/06/21

require(ggplot2)

tht<-read.csv("THT-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 8) [ ,1:2]

#We now data follows a lognormal distribution,
#therefore we generate numbers lognormally distributed
#for the empirical CDF

rlnorm
tht <- cbind(tht,ln)


ggplot(tht, aes(tht$THT)) +
  stat_ecdf(geom = "step")
## Aprox the 53% of the calls are handled within 240 seconds

