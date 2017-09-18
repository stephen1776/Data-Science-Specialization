<<<<<<< HEAD
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
#and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf


fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'

download.file(url = fileUrl, destfile = 'ss06hid.csv')

data <- read.table('ss06hid.csv', header = TRUE, sep = ',')  
head(data)

#Create a logical vector that identifies the households on greater than 10 acres who sold more 
#than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. 
agricultureLogical <- data$ACR == 3 & data$AGS == 6

#Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
#which(agricultureLogical)
which(agricultureLogical)

#What are the first 3 values that result?
#236, 238, 262
#59, 460, 474
#125, 238,262
#153 ,236, 388 
#result [1]  125  238  262  470  555  568  608  643  787 



=======
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
#and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf


fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'

download.file(url = fileUrl, destfile = 'ss06hid.csv')

data <- read.table('ss06hid.csv', header = TRUE, sep = ',')  
head(data)

#Create a logical vector that identifies the households on greater than 10 acres who sold more 
#than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. 
agricultureLogical <- data$ACR == 3 & data$AGS == 6

#Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
#which(agricultureLogical)
which(agricultureLogical)

#What are the first 3 values that result?
#236, 238, 262
#59, 460, 474
#125, 238,262
#153 ,236, 388 
#result [1]  125  238  262  470  555  568  608  643  787 



>>>>>>> 78db4ce689262b10129b03733e068a13e28f8441
