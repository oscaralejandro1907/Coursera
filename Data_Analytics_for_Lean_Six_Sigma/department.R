# Title     : ANOVA for Departments
# Objective : Does a cat var X has a significant effect in num var Y
# Created by: oscarhernandezlopez
# Created on: 05/07/21

## CTQ: throughput time of a client request in days.
## The work is divided in 3 Departments: A, B and C.

## Are the departments equally fast? i.e. Is the throughput
## time equal across the departments?

require(ggplot2)

data<-read.csv("Departments-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:2]

##The format is as it should be

# Compute the analysis of variance
res.aov <- aov(Throughput.times ~ Department, data = data)
# Summary of the analysis
summary(res.aov)

library("ggpubr")
ggline(data, x = "Department", y = "Throughput.times",
       add = c("mean_se", "jitter"),
       order = c("A", "B", "C"),
       ylab = "Throughput Times", xlab = "Departments")

## After the analysis as the p-value < 0.05 it is found
## statistical evidence the throughput time differ across
## departments. Check residuals before validate the conclusion

qqnorm(res.aov$residuals)
qqline(res.aov$residuals)

hist(res.aov$residuals)

## Assumptions are not met, perform Kruskal-Wallis
kruskal.test(data$Throughput.times ~ data$Department, data = data)
## The analysis confirms the conclusion of the ANOVA,
## the p-value<0.05 meaning tHroughput times
## differ across the shifts.

## References:
# http://www.sthda.com/english/wiki/one-way-anova-test-in-r
