# Title     : TODO
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 29/06/21

library(datasets)

data(iris)

#what is the mean of 'Sepal.Length' for the species virginica?
tapply(iris$Sepal.Length, iris$Species, mean)
