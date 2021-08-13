# Title     : TODO
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 11/08/21


best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  ## Check that state and outcome are valid
  if(!(state %in% data$State) ){
    stop("invalid state")
  }
  if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
    stop("invalid outcome")
  }

  ## Return hospital name in that state with lowest 30-day death rate
  df <- as.data.frame(cbind(data[, 2],  # hospital
                            data[, 7],   # state
                            data[, 11],  # heart attack
                            data[, 17],  # heart failure
                            data[, 23]), # pneumonia
                      stringsAsFactors = FALSE)

  colnames(df) <- c("Hospital", "State", "heart attack", "heart failure", "pneumonia")

  interest <- subset(df, df$State==state, select = c("Hospital",outcome))

  interest[,outcome] <- as.numeric(interest[,outcome])
  interest <- interest[!is.na(interest[,outcome]),]

  interest <- interest[order(interest[,outcome]),]

  return(interest[, "Hospital"][1])

}

g<-best("MD","pneumonia")