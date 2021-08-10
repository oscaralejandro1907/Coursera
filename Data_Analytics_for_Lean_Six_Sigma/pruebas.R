printers<-read.csv("Printers-Table 1.csv",
               header = TRUE,
               sep = ",",
               stringsAsFactors = FALSE,
               skip = 6) [ ,1:4]

chisq.test(printers[,2:4])


