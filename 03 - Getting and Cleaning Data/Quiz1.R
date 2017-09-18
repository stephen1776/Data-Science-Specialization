<<<<<<< HEAD
#
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/survey.cvs", method = "curl")
list.files("./data")

library(xlsx)
survData <- read.csv("survey.csv", header = TRUE)
table(survData[,37])



#How many restaurants have zipcode 21231? 
library(XML)
doc1 <- xmlTreeParse("restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc1)
xmlName((rootNode))
names(rootNode)
xpathSApply(rootNode, "//zipcode", xmlValue)
xpathSApply(rootNode, "//1i[@zipcode = '21231']", xmlValue)
rootNode[[1]][[5]]

#The following are ways to calculate the average value of the variable pwgtp15
#broken down by sex. Using the data.table package, which will deliver the fastest user time? 
library(data.table)
DT <- fread(input="data3.csv", sep=",", header = TRUE)
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT[DT$SEX==1,]$pwgtp15) + mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(rowMeans(DT)[DT$SEX==1] + rowMeans(DT)[DT$SEX==2])






DT <- read.csv("data3.csv", header = TRUE)
mean(DT$pwgtp15,by=DT$SEX)
#tapply(DT$pwgtp15,DT$SEX,mean),
#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
#sapply(split(DT$pwgtp15,DT$SEX),mean),
#mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15),
DT[,mean(pwgtp15),by=SEX]
=======
#
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/survey.cvs", method = "curl")
list.files("./data")

library(xlsx)
survData <- read.csv("survey.csv", header = TRUE)
table(survData[,37])



#How many restaurants have zipcode 21231? 
library(XML)
doc1 <- xmlTreeParse("restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc1)
xmlName((rootNode))
names(rootNode)
xpathSApply(rootNode, "//zipcode", xmlValue)
xpathSApply(rootNode, "//1i[@zipcode = '21231']", xmlValue)
rootNode[[1]][[5]]

#The following are ways to calculate the average value of the variable pwgtp15
#broken down by sex. Using the data.table package, which will deliver the fastest user time? 
library(data.table)
DT <- fread(input="data3.csv", sep=",", header = TRUE)
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT[DT$SEX==1,]$pwgtp15) + mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(rowMeans(DT)[DT$SEX==1] + rowMeans(DT)[DT$SEX==2])






DT <- read.csv("data3.csv", header = TRUE)
mean(DT$pwgtp15,by=DT$SEX)
#tapply(DT$pwgtp15,DT$SEX,mean),
#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
#sapply(split(DT$pwgtp15,DT$SEX),mean),
#mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15),
DT[,mean(pwgtp15),by=SEX]
>>>>>>> 78db4ce689262b10129b03733e068a13e28f8441
