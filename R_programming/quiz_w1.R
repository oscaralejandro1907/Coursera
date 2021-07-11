# Title     : TODO
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 21/06/21

df <- read.csv("hw1_data.csv",header = TRUE)

#Names of the Columns of the data frame
names(df)

#Extract the first two rows
df[1:2,]

#How many rows has the dataframe
nrow(df)

#Extracts the last two rows
tail(df,2)

#Value of "Ozone" in the 47 row
df[47,"Ozone"]

#How many missing values has the column "Ozone"
sum(is.na(df$Ozone))

#Calculate the mean of "Ozone" column excluding missing values
mean(df$Ozone, na.rm = TRUE)

#Extract the subset of rows of the data frame where Ozone
# values are above 31 and Temp values are above 90.
# What is the mean of Solar.R in this subset?
sub <- subset(df, df$Ozone>31 & df$Temp>90)
mean(sub$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
june <- subset(df, df$Month==6)
mean(june$Temp, na.rm = TRUE)

#What was the maximum ozone value in the month of May
# (i.e. Month is equal to 5)?
may <- subset(df, df$Month==5)
max(may$Ozone,na.rm = TRUE)
