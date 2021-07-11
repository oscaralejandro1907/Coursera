# Title     : TODO
# Objective : Pie chart, bar chart, tallying data
# Created by: oscarhernandezlopez
# Created on: 21/06/21

require(ggplot2)
require(dplyr) #To use the %>%

df<-read.csv("Reclaims-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:3]

#Which type of reclaim occurs more often?
#Make a pie chart
ggplot(df, aes(x = "Count", y = Reclaim, fill = Reclaim)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0) + theme_bw()

#Roughly "Matching" part of the pie stands for the 1/4
# of the entire pie (25% of the total of reclaims)

#Furthermore, make a bar chart
ggplot(df, aes(x=as.factor(df$Reclaim), fill=as.factor(df$Reclaim) )) +
  geom_bar( ) +
  scale_fill_hue(c = 60) +
  theme(legend.position="none")

#Difference with "Matching" and Status info
# are clearer with the bar chart.
# Matching is the most ocurring reclaim
#Which person handles the most reclaims?
df %>%
  group_by(Person) %>%
  tally()  %>%
  mutate(pct=(100*n)/sum(n))

#This could be done with the pie and bar cahrts but
#it could do with by tallying data , with a tally table
# Marcel and Margriet both handle the most reclaims.
# 22 per person or 18% of the total
