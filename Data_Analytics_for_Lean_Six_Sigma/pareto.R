# Title     : TODO
# Objective : Tallying tables and Pareto analysis
# Created by: oscarhernandezlopez
# Created on: 21/06/21

require(ggplot2)
require(ggQC)

library(dplyr)

df<-read.csv("Pareto-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 7)[ ,1:3]

#How often a problem occurs?
#To answer that we make a Pareto chart of frequencies
causes <- df %>%
  group_by(df$Cause) %>%
  tally()

ggplot(causes, aes(x=`df$Cause`, y=`n`)) +
 stat_pareto(point.color = "red",
            point.size = 3,
            line.color = "black",
            bars.fill = c("blue", "orange")
) +
 theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust=1))

pareto_frequencies <- causes %>% arrange(desc(`n`)) %>%
  mutate(pct=(100*n)/sum(n)) %>%
  mutate(csum = cumsum(pct))

#From this pareto_table can be concluded the 3 main issues
#correspond to the 80% of all problems.

               ####### NEXT QUESTION #######
#Which problems take the most time?
#To answer that we make a Pareto chart of Duration
n<-transform(df, Duration = as.numeric(df$Duration))  #Make numeric and create NA
data<-n[complete.cases(n), ] #Drop NA

duration <- aggregate(as.numeric(data$Duration),
                      by=list(Cause=data$Cause),
                      FUN=sum)

df1<-as.data.frame(duration)


 ggplot(causes, aes(x=df1$Cause, y=df1$x)) +
  stat_pareto(point.color = "red",
             point.size = 3,
             line.color = "black",
             bars.fill = c("blue", "orange")
 ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust=1))


g<-df1[order(df1$x, decreasing = TRUE),]

 pareto_duration <- g %>% arrange(desc(g$x)) %>%
   mutate(pct=(100*g$x)/sum(g$x)) %>%
   mutate(csum = cumsum(pct))

#With this we can conclude that Break of the cookies occur
#less that Deviations but takes most of the time.
#There are four problems that takes 79% of the time the
#the production is stopped