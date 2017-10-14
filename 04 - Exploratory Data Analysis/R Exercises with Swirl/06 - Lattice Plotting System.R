# Lattice Plotting System

library(swirl)

install_from_swirl("Exploratory Data Analysis")
swirl()
# If xyplot produces a scatterplot, what kind of plot does bwplot produce?
# 
# 1: bad and wonderful
# 2: box and whisker
# 3: big and whittle
# 4: black and white
2

# Recall the airquality data we've used before. We've loaded it again for you. To remind yourself
# | what it looks like run the R command head with airquality as an argument to see what the data looks
# | like.
head(airquality)
# Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6

# Now try running xyplot with the formula Ozone~Wind as the first argument and the second argument
# | data set equal to airquality.
xyplot(Ozone ~ Wind, data = airquality)

# Now rerun xyplot with the formula Ozone~Wind as the first argument and the second argument data set
# | equal to airquality (use the up arrow to save typing). This time add the arguments col set equal to
# | "red", pch set equal to 8, and main set equal to "Big Apple Data".

xyplot(Ozone ~ Wind, data = airquality, col = "red", pch = 8, main = "Big Apple Data")
# xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")
# At a command prompt, typing play() allows you to leave swirl
# | temporarily so you can try different R commands at the console. Typing nxt() when you’re done
# | playing brings you back to swirl and you can resume your lesson.

# Run xyplot with the formula Ozone~Wind | as.factor(Month) as the first argument and the second
# | argument data set equal to airquality (use the up arrow to save typing). So far, not much is
# | different, right? Add a third argument, layout, set equal to c(5,1).
xyplot(Ozone ~ Wind | as.factor(Month), data = airquality, layout = c(5,1) )

# Note that the default color and plotting character are back. What did the as.factor(Month) do?
# 
# 1: Huh?
# 2: Randomly divided the data into 5 panels
# 3: Displayed the data by individual months
# 4: Displayed and labeled each subplot with the month's integer
4

# Since Month is a named column of the airquality dataframe we had to tell R to treat it as a factor.
# | To see how this affects the plot, rerun the xyplot command you just ran, but use Ozone ~ Wind |
#   | Month instead of Ozone ~ Wind | as.factor(Month) as the first argument.
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1) )
# Not as informative, right? The word Month in each panel really doesn't tell you much if it doesn't
# | identify which month it's plotting. Notice that the actual data is the same between the two plots,
# | though.

# The print methods for lattice functions actually do the work of plotting the data on the graphics
# | device. They return "plot objects" that can be stored (but it’s usually better to just save the
# code and data). On the command line, trellis objects are auto-printed so that it appears the
# | function is plotting the data.
# | To see this, create a variable p which is assigned the output of this simple call to xyplot,
# | xyplot(Ozone~Wind,data=airquality).

p <- xyplot(Ozone~Wind,data=airquality)
p
# Now run the R command names with p as its argument.
names(p)
# [1] "formula"           "as.table"          "aspect.fill"       "legend"           
# [5] "panel"             "page"              "layout"            "skip"             
# [9] "strip"             "strip.left"        "xscale.components" "yscale.components"
# [13] "axis"              "xlab"              "ylab"              "xlab.default"     
# [17] "ylab.default"      "xlab.top"          "ylab.right"        "main"             
# [21] "sub"               "x.between"         "y.between"         "par.settings"     
# [25] "plot.args"         "lattice.options"   "par.strip.text"    "index.cond"       
# [29] "perm.cond"         "condlevels"        "call"              "x.scales"         
# [33] "y.scales"          "panel.args.common" "panel.args"        "packet.sizes"     
# [37] "x.limits"          "y.limits"          "x.used.at"         "y.used.at"        
# [41] "x.num.limit"       "y.num.limit"       "aspect.ratio"      "prepanel.default" 
# [45] "prepanel"

# We see that the trellis object p has 45 named properties, the first of which is "formula" which
# | isn't too surprising. A lot of these properties are probably NULL in value. We've done some
# | behind-the-scenes work for you and created two vectors. The first, mynames, is a character vector
# | of the names in p. The second is a boolean vector, myfull, which has TRUE values for nonnull
# | entries of p. Run mynames[myfull] to see which entries of p are not NULL.
mynames[myfull]
# [1] "formula"           "as.table"          "aspect.fill"       "panel"            
# [5] "skip"              "strip"             "strip.left"        "xscale.components"
# [9] "yscale.components" "axis"              "xlab"              "ylab"             
# [13] "xlab.default"      "ylab.default"      "x.between"         "y.between"        
# [17] "index.cond"        "perm.cond"         "condlevels"        "call"             
# [21] "x.scales"          "y.scales"          "panel.args.common" "panel.args"       
# [25] "packet.sizes"      "x.limits"          "y.limits"          "aspect.ratio"     
# [29] "prepanel.default" 
#29 nonNull values for one little plot. Note that a lot of them are like the ones we saw in the
#base plotting system. Let's look at the values of some of them. Type p[["formula"]] now.
p[["formula"]]
# Ozone ~ Wind

# Now look at p's x.limits. Remember the double square brackets and quotes.
p[["x.limits"]]
#[1]  0.37 22.03

# Panel functions receive the x and y coordinates of the data points in their panel (along with any
# ptional arguments). To see this, we've created some data for you - two 100-long vectors, x and y.
# | For its first 50 values y is a function of x, for the last 50 values, y is random. We've also
# | defined a 100-long factor vector f which distinguishes between the first and last 50 elements of
# | the two vectors. Run the R command table with f as it argument.

table(f)
# f
# Group 1 Group 2 
# 50      50 

# The first 50 entries of f are "Group 1" and the last 50 are "Group 2". Run xyplot with two
# | arguments. The first is the formula y~x|f, and the second is layout set equal to c(2,1). Note that
# | we're not providing an explicit data argument, so xyplot will look in the environment and see the x
# | and y that we've generated for you.
xyplot(y ~ x | f, layout = c(2,1) )
#look at v1
v1
#[1] -2.185287  1.101780 -2.716851  1.569850


# The first two numbers are the range of the x values of Group 1 and the last two numbers are the
# | range of y values of Group 1. See how they match the values of the left panel (Group 1) in the
# | plot. Now look at v2 which holds the comparable numbers for Group 2.
v2
# [1] -1.6066772  2.2205197 -0.1605085  2.0341048

# Again, the values match the plot. That's reassuring. We've copied some code from the slides for
#you. To see it, type myedit("plot1.R"). This will open your editor and display the R code in it.
myedit("plot1.R")
# How many calls to basic lattice plotting functions are there in plot1.R?
# 
# 1: 1
# 2: 2
# 3: 3
1
# Note the panel function. How many formal arguments does it have?
# 
# 1: 1
# 2: 2
# 3: 3
3

# We've defined a function for you, pathtofile, which takes a filename as its argument. This makes
# | sure R can find the file on your computer. Now run the R command source with two arguments. The
# | first is the call to pathtofile with the string "plot1.R" as its argument and the second is the
# | argument local set equal to TRUE. This command will run the code contained in plot1.R within the
# | swirl environment so you can see what it does.

source(pathtofile("plot1.R"), local = TRUE)

# See how the lines appear. The plot shows two panels because...?
# 
# 1: f contains 2 factors
# 2: lattice can handle at most 2 panels
# 3: there are 2 calls to panel methods
# 4: there are 2 variables
1

# We've copied another piece of similar code, i.e., a call to xyplot with a custom panel function,
# | from the slides. To see it, type myedit("plot2.R"). This will open your editor and display the R
# | code in it.
myedit("plot2.R")

# Again, run the R command source with the two arguments pathtofile("plot2.R") and local=TRUE. This
#will run the code in plot2.R.
source(pathtofile("plot2.R"), local = TRUE)
# The regression lines are red because ...?
# 
# 1: R is the first letter of the word red
# 2: the custom panel function specified a col argument
# 3: R always plots regression lines in red
2


# The data is in the data frame diamonds. Use the R command str to see what it looks like.
str(diamonds)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	53940 obs. of  10 variables:
#   $ carat  : num  0.23 0.21 0.23 0.29 0.31 0.24 0.24 0.26 0.22 0.23 ...
# $ cut    : Ord.factor w/ 5 levels "Fair"<"Good"<..: 5 4 2 4 2 3 3 3 1 3 ...
# $ color  : Ord.factor w/ 7 levels "D"<"E"<"F"<"G"<..: 2 2 2 6 7 7 6 5 2 5 ...
# $ clarity: Ord.factor w/ 8 levels "I1"<"SI2"<"SI1"<..: 2 3 5 4 2 6 7 3 4 5 ...
# $ depth  : num  61.5 59.8 56.9 62.4 63.3 62.8 62.3 61.9 65.1 59.4 ...
# $ table  : num  55 61 65 58 58 57 57 55 61 61 ...
# $ price  : int  326 326 327 334 335 336 336 337 337 338 ...
# $ x      : num  3.95 3.89 4.05 4.2 4.34 3.94 3.95 4.07 3.87 4 ...
# $ y      : num  3.98 3.84 4.07 4.23 4.35 3.96 3.98 4.11 3.78 4.05 ...
# $ z      : num  2.43 2.31 2.31 2.63 2.75 2.48 2.47 2.53 2.49 2.39 ...

#So the data frame contains 10 pieces of information for each of 53940 diamonds. Run the R command
#table with diamonds$color as an argument.
table(diamonds$color)
# D     E     F     G     H     I     J 
# 6775  9797  9542 11292  8304  5422  2808 

# We see 7 colors each represented by a letter. Now run the R command table with two arguments,
# diamonds$color and diamonds$cut.
table(diamonds$color, diamonds$cut)
# Fair Good Very Good Premium Ideal
# D  163  662      1513    1603  2834
# E  224  933      2400    2337  3903
# F  312  909      2164    2331  3826
# G  314  871      2299    2924  4884
# H  303  702      1824    2360  3115
# I  175  522      1204    1428  2093
# J  119  307       678     808   896

# We see a 7 by 5 array with counts indicating how many diamonds in the data frame have a particular
# color and cut. From the table, which is the most frequent combination?
# 
# 1: Ideal color of cut G
# 2: Premium cut of color G
# 3: Ideal cut of color F.
# 4: Ideal cut of color G

4

# To save you some trouble we've defined three character strings for you, labels for the x- and
# y-axes and a main title. They're in the file myLabels.R, so run myedit on this file to see them.
# Remember to put the file name in quotes when you call myedit.
myedit("myLabels.R")

# Now run source with pathtofile("myLabels.R") and local set equal to TRUE.
source(pathtofile("myLabels.R"), local = TRUE)

# Now call xyplot with the formula price~carat | color*cut and data set equal to diamonds. In
# addition, set the argument strip equal to FALSE, pch set equal to 20, xlab to myxlab, ylab to
# myylab, and main to mymain. The plot may take longer than previous plots because it is bigger.
xyplot(price~carat|color*cut,data=diamonds,strip=FALSE,pch=20,xlab=myxlab,ylab=myylab,main=mymain)

# 35 panels, one for each combination of color and cut. The dots (pch=20) show
# how prices for the diamonds in each category (panel) vary depending on carat.
#
#Are colors defining the rows or columns of the plot?
# 
# 1: columns
# 2: rows

1

# Now rerun the xyplot command you just ran, this time without the strip argument.
xyplot(price~carat|color*cut,data=diamonds,pch=20,xlab=myxlab,ylab=myylab,main=mymain)

#The plot shows that the strip argument ....

# 1: makes the plot less intelligible
# 2: removes information from the plot
# 3: has a default value of FALSE
# 4: labels each panel
4

# True or False? Lattice plots are constructed by a series of calls to core functions.
# 
# 1: False
# 2: True
1

# True or False? Lattice plots are constructed with a single function call to a core lattice function
# (e.g. xyplot)
# 1: True
# 2: False
1

# True or False? Aspects like margins and spacing are automatically handled and defaults are usually
# sufficient.
# 
# 1: False
# 2: True
2
# 
# True or False? The lattice system is ideal for creating conditioning plots where you examine the
# same kind of plot under many different conditions.
# 
# 1: True
# 2: False
1

# True or False? The lattice system, like the base plotting system, returns a trellis plot object.

# 1: True
# 2: False
2
# 
# True or False?  Panel functions can NEVER be customized to modify what is plotted in each of the
# plot panels.
# 
# 1: False
# 2: True
1

# True or False?  Lattice plots can display at most 20 panels in a single plot.
# 
# 1: False
# 2: True
1
