# Title     : TODO
# Objective : Histogram, boxplot
# Created by: oscarhernandezlopez
# Created on: 21/06/21

require(ggplot2)

coffee_df<-read.csv("Caffeine_batches-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:2]

summary(coffee_df)

reclaims_df<-read.csv("Investigation_time-Table_1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 11)

#Make a histogram of Total Time
ggplot(data = reclaims_df, aes(reclaims_df$Total.time)) +
  geom_histogram(fill="#56B4E9",binwidth = 2) +
  xlab("Total time (in days)") +
  theme_bw()
  #Roughly 130 values have a time around 0.
  # Larger total times are more scarce.
  # Total times of 45 days or more, rarely occur



#Make a boxplot of Total Time
ggplot(reclaims_df, aes(x=0, y=reclaims_df$Total.time)) +
  geom_boxplot()
  #Median is around 4, therefore 50% of all claims are handled within 4 days
  #75% of the claims are handled within 12 days.
  #There is a very short whisker at the bottom and a very large at the top
  #as well as many outliers at the top, showing an skewed distribution
  #also seen in the histogram


