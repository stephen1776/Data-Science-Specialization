# Exploratory Data Analysis Course Project 2
# Stephen Blatti

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data to get Baltimore's data.
baltimore_NEI <- NEI[NEI$fips == "24510",]

# Aggregate Baltimore's total emissions by year
total_EmissionsBalt <- aggregate(baltimore_NEI$Emissions, list(baltimore_NEI$year), FUN = "sum")

# plot2
png("plot2.png",width=480,height=480)

barplot(
  (total_EmissionsBalt$x),
  names.arg=totalEmissions$Group.1,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total emissions in Baltimore from 1999 to 2008"
)

dev.off()

