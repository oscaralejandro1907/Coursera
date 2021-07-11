# Title     : TODO
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 24/06/21


#https://rstudio-pubs-static.s3.amazonaws.com/220397_d07534a9d3de4d0d87d7df9036602296.html

#set the working directory from which the files will be read from
#setwd("/Users/oscarhernandezlopez/Documents/GitHub/Coursera/R_programming/specdata")

values <- c()

pollutantmean <- function (dir,pollutant,id=1:332) {
## 'pollutant' is a "sulfate" or "nitrate"
  for (i in id) {
    path <- paste(getwd(), "/", dir, "/", sprintf("%03d",i),".csv",sep="")
    data <- read.csv(path)
    df <- data[pollutant]
    values <- c(values,df[!is.na(df)])
  }
  mean(values)
}

complete <- function (dir,id=1:332){
  df <- data.frame(id=numeric(), nobs=numeric())
  for (i in id) {
    path <- paste(getwd(), "/", dir, "/", sprintf("%03d",i),".csv",sep="")
    data <- read.csv(path)
    data_complete <- data[complete.cases(data), ]

    nobs <- nrow(data_complete)
    df <- rbind(df,data.frame(id=i, nobs=nobs))
  }
  df
}

corr <- function (dir, threshold = 0){
  cor_results <- c()

  select <- complete(dir)
  select <- select[select$nobs>=threshold, ]
  if(nrow(select)>0){
    for (i in select$id){
      path <- paste(getwd(), "/", dir, "/", sprintf("%03d",i),".csv",sep="")
      data <- read.csv(path)
      data_complete <- data[complete.cases(data), ]

      sulfate_data <- data_complete["sulfate"]
      nitrate_data <- data_complete["nitrate"]
      #cor_results <- c(cor_results,))
      
    }
  }
  #print(nitrate_data)
  cor_results
}


as.numeric(cor.test(1:10, 2:11)$estimate[1])


#pollutantmean(dir = "specdata","nitrate",1)
corr("specdata",300)

