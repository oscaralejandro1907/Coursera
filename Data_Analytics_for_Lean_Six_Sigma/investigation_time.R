# Title     : TODO
# Objective : Histogram
# Created by: oscarhernandezlopez
# Created on: 18/06/21

require(ggplot2)

getwd()

data<-read.csv("Investigation_time-Table_1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 11)

ggplot(data = data, aes(data$Total.time)) + geom_histogram(fill="#56B4E9",binwidth = 2) +
  xlab("Total time (in days)") +
  theme_bw()


