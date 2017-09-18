#
# data1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character"(data1))
# names(data1)
                  
                  
best <- function(state, outcome){
  # read outcome data
  ocmData <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  stateName <- ocmData[ocmData[,"State"] == state, ]
  
  # var's for the 30 day mortalities from heart attack, heart failure, 
  # or pneumonia
  
  # check that state and outcome are valid
 
    if (!state %in% ocmData$State) {
      stop("invalid state")
    }
    else if(outcome == "heart attack") {
      # Col 7 is state, Col 2 is hospital name, Col 11 is 30 day death Heart attack rate
      outcome_30D_DHAttack <- as.numeric(stateName[, 11]) # Col 11 Death by Heart Attack
      minDeath <- min(outcome_30D_DHAttack, na.rm = TRUE)
      minIndex <- which(outcome_30D_DHAttack == minDeath)
      hosName <- stateName[minIndex, 2] # Col 2 Hospital Names
      
    } 
    else if(outcome == "heart failure") {
      outcome_30D_DHFailure <- as.numeric(stateName[, 17]) # Col 17 Death by Heart Failure
      minDeath <- min(outcome_30D_DHFailure, na.rm = TRUE)
      minIndex <- which(outcome_30D_DHFailure == minDeath)
      hosName <- stateName[minIndex, 2] # Col 2 Hospital Names
      
    } 
    else if(outcome == "pneumonia") {
      outcome_30D_DPneumonia <- as.numeric(stateName[, 23]) # Col 23 Death by Pneumonia
      minDeath <- min(outcome_30D_DPneumonia, na.rm = TRUE)
      minIndex <- which(outcome_30D_DPneumonia == minDeath)
      hosName <- stateName[minIndex, 2] # Col 2 Hospital Names
      
    }
    else {
      stop("invalid outcome")
    }
    
  
  
  # return hospital name in the state w the lowest 30 day death rate
  return(hosName)
}

  # test
  # best("TX", "heart attack")
  #[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
#> best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"