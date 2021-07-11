# Title     : TODO
# Objective : Find the best fitting distribution of data
#             to determine which distribution you should use
#             to model the population of a sample.
# Created by: oscarhernandezlopez
# Created on: 25/06/21

require(ggplot2)
require(ggpubr)
require(qqplotr)

require(e1071)
require(EnvStats)

tht<-read.csv("THT-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 8) [ ,1:2]

ggplot(data = tht, aes(tht$THT)) +
  geom_histogram(fill="#56B4E9",binwidth = 60) +
  xlab("Total handling time") +
  theme_bw()
#From the histogram it is seem data doesn fit a normal distribution

#Normal probability plot
#ggqqplot(tht$THT)

norm <- rnorm(length(tht$THT))
gg <- ggplot(data = as.data.frame(tht$THT), mapping = aes(sample = norm)) +
     stat_qq_band() +
     stat_qq_line() +
     stat_qq_point()
    gg + labs(x = "Theoretical Quantiles", y = "Sample Quantiles")


probplot(tht$THT,"qnorm")

probplot(tht$THT,"qlnorm")

probplot(tht$THT,"qweibull",shape=1)

#Anderson-Darling Test
is.normal <- gofTest(tht$THT, distribution = "norm",test = "ad")
is.normal$statistic

is.weibull <- gofTest(tht$THT, distribution = "weibull",test = "ad")
is.weibull$statistic

is.lognormal <- gofTest(tht$THT, distribution = "lnorm",test = "ad")
is.lognormal$statistic

#The lower the AD value, the better the fit,
#so we select the lognormal as the one which fit the best