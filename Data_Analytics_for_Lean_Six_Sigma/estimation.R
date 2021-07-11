# Title     : TODO
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 24/06/21

coffee_sample<-read.csv("Caffeine_batches-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:2]

#What you can say about the total population using a smaple?
ggplot(coffee_sample, aes(coffee_sample$Caffeine.)) +
  geom_histogram(fill="#56B4E9",bins = 10) +
  stat_function(fun = dnorm, args = list(mean = mean(coffee_sample$Caffeine.), sd = sd(coffee_sample$Caffeine.)))


summary(coffee_sample$Caffeine.)

#Confident interval
#lmodel <- lm(coffee_sample$Caffeine.~1,coffee_sample)
#confint(lmodel)

t.test(coffee_sample$Caffeine)
#The mean caffeine percentage of the population will be
#in between this two values with 95% certainty
