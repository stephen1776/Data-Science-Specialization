#2. Using the jpeg package read in the following picture of your instructor into R
#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'

download.file(url = fileUrl, destfile = 'jeff.jpg')

install.packages("jpeg")
library(jpeg)
?readJPEG
#Use the parameter native=TRUE. 
jpg_jeff <- readJPEG('jeff.jpg', native = TRUE)  
#first download was corrupt for some reason
#What are the 30th and 80th quantiles of the resulting data? 
?quantile
quantile(jpg_jeff, probs = c(0.3, 0.8))
#(some Linux systems may produce an answer 638 different for the 30th quantile)
#-15259150 -10575416
#-10904118 -10575416
#-15259150 -594524
#-14191406 -10904118

#result      30%       80% 
#      -15259150 -10575416 