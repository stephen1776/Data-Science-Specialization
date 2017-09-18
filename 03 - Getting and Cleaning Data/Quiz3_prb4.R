#4. What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
#23.966667, 30.91304
#23, 45
#23, 30
#30, 37
#32.96667, 91.91304
#133.72973, 32.96667 




tapply(merge1$Rank, merge1$`Income Group`, mean)
#High income: nonOECD    High income: OECD           Low income  Lower middle income  Upper middle income 
#        91.91304             32.96667            133.72973            107.70370             92.13333 







