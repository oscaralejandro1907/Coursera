# Title     : Regression Analysis
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 28/07/21

data<-read.csv("Tea bags-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 7) [ ,1:3]

linearMod <- lm(data$Bags ~ data$Stops,data = data)
summary(linearMod)

plot(x=data$Stops, y=data$Bags, xlab="Stops",ylab = "Bags",pch = 19,frame=FALSE)
abline(linearMod, col="blue")

## p-value is less 0.05 so there is a significant relationship between stops and bags
## R-squared is high, so the stops are a strong predictor for the number of broken tea bags



