# Programming Assignment 3
# p1
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

# p2

best <- function(state, outcome){
  # read outcome data
  
  # check tat state and outcome are valid
  
  # return hospital name in the state w the lowest 30 day death rate
}