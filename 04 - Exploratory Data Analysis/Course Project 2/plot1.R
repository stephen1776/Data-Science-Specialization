# Exploratory Data Analysis Course Project 2
# Stephen Blatti

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# head(NEI)
# head(SCC)

# Aggregate total emissions by year
totalEmissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")

# plot1
png("plot1.png",width=480,height=480)

barplot(
  (totalEmissions$x) / 10^6,
  names.arg=totalEmissions$Group.1,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total emissions in the U.S. from 1999 to 2008"
)

dev.off()


