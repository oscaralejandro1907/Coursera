# Title     : TODO
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 23/06/21

data<-read.csv("Investigation_time-Table_1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 11)

#What are the average and standard deviation of the total time?
mean(data$Total.time)
sd(data$Total.time)

#Estimate how many reclaims are handled within 15 days?
#(You can use the quartiles)
summary(data$Total.time)
# As the 3rd quartile (75% of data reclaims) are handled
#within 12 days, reclaims handled within 15 days
# are aproximatley the 80%.

#Is the distribution symmetrical?
  #No. Check the histogram in the file "descriptive_statistics.R".

#Which type of reclaim occured more often?

ggplot(data, aes(x=as.factor(data$Type), fill=as.factor(data$Type) )) +
  geom_bar( ) +
  scale_fill_hue(c = 60) +
  theme(legend.position="none")

require(dplyr)

type <- data %>%
  group_by(data$Type) %>%
  tally()