# Title     : Work in a hospital
# Objective : What is the percentage of patients
#             with a maximum stay of 10 days
# Created by: oscarhernandezlopez
# Created on: 27/06/21

require(ggplot2)

stay <-read.csv("Length of stay-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 5) [ ,1]

ggplot(as.data.frame(stay), aes(stay )) +
  stat_ecdf(geom = "step")

interested_percentage <- sum(stay > 10) / length(stay)
