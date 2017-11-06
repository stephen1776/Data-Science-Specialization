# Exploratory Data Analysis Course Project 2
# Stephen Blatti

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data to get coal combustion-related data.
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combustion_SCC <- SCC[combustion & coal,]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]

# Factor year
combustion_NEI$year <- factor(combustion_NEI$year, levels=c('1999', '2002', '2005', '2008'))

# plot4
# library(ggplot2)
png("plot4.png",width=480,height=480)

ggplot(data=combustion_NEI,aes(x = year,y = Emissions / 10^3) ) +
  theme_bw() +
  geom_bar(stat="identity", fill="blue") +
  labs(x="Year", y=expression("PM "[2.5]*"  Emissions (kilotons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Related Emmisions"))


dev.off()

