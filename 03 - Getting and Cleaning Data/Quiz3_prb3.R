<<<<<<< HEAD
#Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#Load the educational data from this data set:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv


fileUrl1 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
fileUrl2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(url = fileUrl1, destfile = 'GDP2.csv', mode='wb')
download.file(url = fileUrl2, destfile = 'EDStats_Country2.csv', mode='wb')
GDP_data <- read.csv('GDP.csv', header = TRUE, skip = 4)# skip 3 lines after header  
EDStats_data <- read.csv('EDStats_Country.csv', header = TRUE)
head(GDP_data)
library(data.table)
library(dplyr)
#error below need to redownload GDP.csv and EDStats.csv files with mode = 'wb'.
#Something about windows in text mode and extra \r
#190 countries in GDP
GDP_data2 <- fread("GDP2.csv", skip = 4, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Dollars"))
EDStats_data2 <- fread("EDStats_Country2.csv")
head(GDP_data2)
head(EDStats_data2)
View(GDP_data2)
View(EDStats_data2)



merge1 <- merge(GDP_data2, EDStats_data2, by = 'CountryCode')
#Match the data based on the country shortcode. How many of the IDs match? 
nrow(merge1)
#189
#Sort the data frame in descending order by GDP rank (so United States is last). 
#What is the 13th country in the resulting data frame?

arrange(merge1, desc(Rank))[13, 'Economy']
#St. Kitts and Nevis



#Match the data based on the country shortcode. How many of the IDs match? 

#Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
#http://data.worldbank.org/data-catalog/ed-stats
#234 matches, 13th country is St. Kitts and Nevis
#234 matches, 13th country is Spain
#190 matches, 13th country is Spain
#189 matches, 13th country is Spain
#190 matches, 13th country is St. Kitts and Nevis
#189 matches, 13th country is St. Kitts and Nevis Correct






=======
#Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#Load the educational data from this data set:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv


fileUrl1 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
fileUrl2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(url = fileUrl1, destfile = 'GDP2.csv', mode='wb')
download.file(url = fileUrl2, destfile = 'EDStats_Country2.csv', mode='wb')
GDP_data <- read.csv('GDP.csv', header = TRUE, skip = 4)# skip 3 lines after header  
EDStats_data <- read.csv('EDStats_Country.csv', header = TRUE)
head(GDP_data)
library(data.table)
library(dplyr)
#error below need to redownload GDP.csv and EDStats.csv files with mode = 'wb'.
#Something about windows in text mode and extra \r
#190 countries in GDP
GDP_data2 <- fread("GDP2.csv", skip = 4, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Dollars"))
EDStats_data2 <- fread("EDStats_Country2.csv")
head(GDP_data2)
head(EDStats_data2)
View(GDP_data2)
View(EDStats_data2)



merge1 <- merge(GDP_data2, EDStats_data2, by = 'CountryCode')
#Match the data based on the country shortcode. How many of the IDs match? 
nrow(merge1)
#189
#Sort the data frame in descending order by GDP rank (so United States is last). 
#What is the 13th country in the resulting data frame?

arrange(merge1, desc(Rank))[13, 'Economy']
#St. Kitts and Nevis



#Match the data based on the country shortcode. How many of the IDs match? 

#Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
#http://data.worldbank.org/data-catalog/ed-stats
#234 matches, 13th country is St. Kitts and Nevis
#234 matches, 13th country is Spain
#190 matches, 13th country is Spain
#189 matches, 13th country is Spain
#190 matches, 13th country is St. Kitts and Nevis
#189 matches, 13th country is St. Kitts and Nevis Correct






>>>>>>> 78db4ce689262b10129b03733e068a13e28f8441
