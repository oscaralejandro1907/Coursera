# Title     : Practice visualizations
# Objective : Simple Boxplot
# Created by: oscarhernandezlopez
# Created on: 24/06/21

require(ggplot2)

coffee<-read.csv("Caffeine-3-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 7) [ ,1:3]

#Is batch also an factor influence factor for caffeine
# percentage? and if it is what batch is the best to produce
#decaffeine coffee

coffee$Batch.nr. <- as.factor(coffee$Batch.nr.)

ggplot(coffee, aes(x=Batch.nr., y=Caffeine., fill=coffee$Batch.nr.)) +
  geom_boxplot()
#From the Boxplot there is no difference. Not a single batch
#is cumplying with the norm of 0.1% percentage
