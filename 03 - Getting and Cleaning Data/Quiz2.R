#1. 
# Load library and require the package:
library(httr)
require(httpuv)
require(jsonlite)
# library(rjson)
# setting the OAuth for github:
oauth_endpoints("github")
# after register an application through https://github.com/settings/applications
myapp <- oauth_app("myQ2App", 
                   key = "8308b657ae049ee43a12", 
                   secret = "ec74765b59382704c3a3039ba79835e3511abfc2")
# get OAuth credentials:
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# use API:
req <- GET("https://api.github.com/users/jtleek/repos", 
           config(token = github_token))
stop_for_status(req)
output <- content(req)
jsondata <- fromJSON(toJSON(output))
subset(jsondata, name == "datasharing", select = c(created_at))

# the result was:  created_at
# 11 2013-11-07T13:25:07Z

# 2.
#The sqldf package allows for execution of SQL commands on R data frames. 
#We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
#Download the American Community Survey data and load it into an R object called 

# After install the package "sqldf", download the file from the Internet, use browser or commands:

library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl,destfile="getdata.csv")
acs <- read.csv("getdata.csv")
#Which of the following commands will select only the data for the probability weights pwgtp1 with 
# ages less than 50?
sqldf("select pwgtp1 from acs where AGEP < 50")
#sqldf("select pwgtp1 from acs")
#sqldf("select * from acs where AGEP < 50 and pwgtp1")
#sqldf("select * from acs")

# 3
# Using the same data frame you created in the previous problem, what is the equivalent function 
# to unique(acs$AGEP)
#sqldf("select distinct AGEP from acs")
#sqldf("select unique * from acs")
#sqldf("select distinct pwgtp1 from acs")
#sqldf("select AGEP where unique from acs")


unique(acs$AGEP)
#sqldf("select AGEP where unique from acs")
sqldf("select distinct AGEP from acs")
# sqldf("select distinct pwgtp1 from acs")


#4
#How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
#http://biostat.jhsph.edu/~jleek/contact.html
#(Hint: the nchar() function in R may be helpful)

# read the url
char <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(char)
close(char)

#find the desired results
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])
# the results are: 45, 31, 7, 25


#5
#Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
#Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
#(Hint this is a fixed width file format)

#Try to combine the "download" and "read" function together use the command line:

# useful: https://stackoverflow.com/questions/14383710/read-fixed-width-text-file

data <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
                 skip = 4,
                 widths = c(12, 7,4, 9,4, 9,4, 9,4))
sum(data[, 4])


#another way - actually same thing

library(readr)

x1 <- read.fwf(
  file="https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",   
  skip=4,
  widths =c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(x1[,4])



# another way
x <- readLines(con=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"))

# Skip 4 lines
x <- x[-(1:4)]

mydata <- data.frame(var1 = substr(x,1,10),
                     var2 = substr(x, 16,19),
                     var3 = substr(x, 20, 23),
                     var4 = substr(x, 29, 32)  # and so on and so on
)
sum(mydata$var4)


















