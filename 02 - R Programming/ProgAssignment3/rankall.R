#

rankall <- function(outcome, num = "best") {
  ocmData <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available")
  ## Check that state and outcome are valid
  
  # get the desired 30 day death rate
  byDeathRate <- if (outcome == "heart attack") {
    ocmData[, 11] <- as.numeric(ocmData[, 11])
    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if (outcome == "heart failure") {
    ocmData[, 17] <- as.numeric(ocmData[, 17])
    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if (outcome == "pneumonia") {
    ocmData[, 23] <- as.numeric(ocmData[, 23])
    "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } else {
    stop("invalid outcome")
  }
  
  stateData <- split(ocmData[, c("Hospital.Name", "State", byDeathRate)], ocmData$State)
  
  hosRank <- function(stateDataOdr, num) {
    order_stateData <- order(stateDataOdr[3], stateDataOdr$Hospital.Name, na.last=NA)
    
    if (num == "best") {
      stateDataOdr$Hospital.Name[order_stateData[1]]
    } else if (num == "worst") {
      stateDataOdr$Hospital.Name[order_stateData[length(order_stateData)]]
    } else if (is.numeric(num)) {
      stateDataOdr$Hospital.Name[order_stateData[num]]
    } else {
      stop("NA")
    }
  }
  
  hosNames <- lapply(stateData, hosRank, num)
  # return data frame
  data.frame(hospital = unlist(hosNames), state = names(hosNames), row.names = names(hosNames))
}