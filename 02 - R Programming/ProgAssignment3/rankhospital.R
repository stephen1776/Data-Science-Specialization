rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ocmData <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available")
  ## Check that state and outcome are valid
  if(!(state %in% levels(factor(ocmData$State)))) {
    stop("invalid state")
  }
  if(!(outcome == "heart attack" || outcome == "heart failure" || outcome == "pneumonia")) {
    stop("invalid outcome")
  }
  if(class(num) == "character"){
    if(!(num == "best" || num == "worst")){
      stop("invalid number")
    }
  }
  # get the desired 30 day death rate
  byDeathRate <- if(outcome == "heart attack") {
    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if(outcome == "heart failure") {
    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if(outcome == "pneumonia") {
    "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } else {
    stop("invalid outcome")
  }
  
  stateData <- ocmData[ocmData$State == state, c("Hospital.Name", byDeathRate)]
  
  if (nrow(stateData) == 0) {
    stop("invalid state")	
  }
  # order by death rate and hospital name
  stateData[,2] <- as.numeric(stateData[,2])
  order_stateData <- order(stateData[byDeathRate], stateData$Hospital.Name, na.last=NA)
  
  ## Return hospital name in that state with the given rank 30-day death rate
  if (num == "best") {
    as.character(stateData$Hospital.Name[order_stateData[1]])
  } else if (num == "worst") {
    as.character(stateData$Hospital.Name[order_stateData[length(order_stateData)]])
  } else if (is.numeric(num)) {
    as.character(stateData$Hospital.Name[order_stateData[num]])
  } else {
    stop("NA")
  }
}