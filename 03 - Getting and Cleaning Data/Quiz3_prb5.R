#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
#How many countries are Lower middle income but among the 38 nations with highest GDP?
#0
#13
#5
#1
?cut
merge1$RankGroups <- cut(merge1$Rank, breaks = 5)
table(merge1$RankGroups, merge1$`Income Group`)

#              High income: nonOECD High income: OECD Low income Lower middle income Upper middle income
#(0.811,38.8]                    4                18          0                   5                  11
#(38.8,76.6]                     5                10          1                  13                   9
#(76.6,114]                      8                 1          9                  12                   8
#(114,152]                       4                 1         16                   8                   8
#(152,190]                       2                 0         11                  16                   9









