# Title     : TODO
# Objective : Scatterplot, boxplot, tallying tables
# Created by: oscarhernandezlopez
# Created on: 23/06/21

require(ggplot2)
library(dplyr)

#Visualizing Y and X numerical variables (Scatterplot)
df<-read.csv("Caffeine-2-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 7) [ ,1:3]

ggplot(df, aes(x=`Extraction.time`, y=`Caffeine.Content`)) +
  geom_point()
#The caffeine content decreases as the extraction time increases

#Visualizing Y numerical and X categorical (Boxplot)
df2<-read.csv("Caffeine-3-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 7) [ ,1:3]

df2$Extractor.nr. <- as.factor(df2$Extractor.nr.)

ggplot(df2, aes(x=Extractor.nr., y=Caffeine., fill=df2$Extractor.nr.)) +
  geom_boxplot()
#As a requirement we want our caffeine percentage to be <0.1%,
#thus, with this boxplot we can see Machine 3 produces coffe
#that do not meet this spacification.

#Visualizing Y categorical and X numerical (Transposed Boxplot)
df3<-read.csv("Student-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:3]

#We would like to know if the student Math grade in high school
# affects the likelihood of passing firat year in collage
df3 <- transform(df3, Math.grade = as.numeric(df3$Math.grade)) #To create NA make numeric first
df3<-df3[complete.cases(df3), ]

ggplot(df3, aes(x=Math.grade, y=df3$Pass.,fill=df3$Pass. )) +
  geom_boxplot()
#We see the students who pass the first year
#has a higher grades in math classes than students who
#didn't pass the first year

#Visualizing Y and X categorical variables ()
df4<-read.csv("Hospital-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 7) [ ,1:3]

#Does each specialist goes to different department
#equally frequently
dat <- df4 %>%
  group_by(Specialist,Department) %>%
  tally()

dat1 <- as.data.frame(dat)

ggplot(dat1, aes(y=n , x=Specialist, fill=Department)) +
    geom_bar(position="stack", stat="identity") +
  geom_text(aes(label = n), position = position_stack(vjust= 0.5),colour = "white", size = 5)