# Title     : TODO
# Objective : Explore the effect of a cat var  X on a num var Y
# Created by: oscarhernandezlopez
# Created on: 05/07/21

## CTQ: produced goods in kg
## Influence factor: The shifts:Morning, evening and night
## Are shifts equally productive?

require(ggplot2)

data<-read.csv("Productivity-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:3]

#An ANOVA analysis is required because of the nature of
#variables

#Organize/Prepare data
df<-stack(data)

#Perform the ANOVA
aov <- aov(lm(df$values ~ df$ind))
summary(aov)

## p value shows no evidence of difference
## in productivity due to shifts, but residuals must be
## verified to validate this conclusion.

#Residuals
plot(aov$residuals) #Independency

#Normality
hist(aov$residuals)

qqnorm(aov$residuals)
qqline(aov$residuals)

library("ggpubr")
ggline(df, x = "ind", y = "values",
       add = c("mean_se", "jitter"),
       order = c("Shift.1", "Shift.2", "Shift.3"),
       ylab = "Residuals", xlab = "Shift")

## After seeing the graphs some assumptions of the ANOVA
## are not satisfied, therefore as an alternative, perform
## a Kruskal-Wallis analysis, or investigate the two outliers

kruskal.test(df$values ~ df$ind, data = df)
## The analysis differ from the ANOVA, the p-value<0.05
## meaning productivity differs across the shifts.
