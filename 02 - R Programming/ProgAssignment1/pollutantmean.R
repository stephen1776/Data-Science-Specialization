pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate 
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the population across all monitors listed
  ## in the 'id' vector (ignoring NA values)
  ## Note: do not round result
  
  
  # Set the usr def'd directory var
  dir = directory
  
  #get the files that the usr wants used from user input or the default id values of width = 3
  dirFiles = paste(dir,"/",formatC(id, width = 3, flag = "0"), ".csv",
                     sep="")
  
  dataList = lapply(dirFiles, read.table, header = TRUE, sep = ",")
  
  polData = do.call("rbind", dataList)
  
  if (pollutant == "sulfate") {
    polMean=mean(polData[[2]], na.rm=TRUE)  
  }
  
  if (pollutant == "nitrate") {
    polMean=mean(polData[[3]], na.rm=TRUE)
  }
  polMean
}