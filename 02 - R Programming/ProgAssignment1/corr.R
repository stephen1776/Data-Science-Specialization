corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all variables)
  ## required to compute the correlation between nitrate and sulfate;
  ## the default is 0
  
  ## Return a numeric vector of correlations
  ## do not round result
  
  
  tcorr <- function(g) {
    data <- read.csv(file.path(directory, g))
    nobs <- sum(complete.cases(data))
    if(nobs > threshold) {
      # complete.obs - missing values are handled by casewise deletion
      return(cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
  }

  #get the correlations incl NULL vals
  getAllCorr <- sapply(list.files(directory), tcorr) 
  #then remove the NULL vals
  RemNullCorr <- unlist(getAllCorr[!sapply(getAllCorr, is.null)]) 
  return(RemNullCorr)
}
