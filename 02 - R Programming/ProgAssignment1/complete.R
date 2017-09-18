complete <- function(directory, id = 1:332) {
  ## return a data frame of the form:
  ## id nobs
  ## 1 117
  ## 2 1041
  ## ...
  ## where 'id' is the monitor id numer and 'nobs' is the 
  ## number of complete cases
  nobs <- function(fname) sum(complete.cases(read.csv(fname)))
  fileNames <- list.files(directory, full.names=TRUE)[id]
  return(data.frame(id = id, complete = unlist(lapply(fileNames, nobs))))
}

  