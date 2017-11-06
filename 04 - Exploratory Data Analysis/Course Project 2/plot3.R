# Exploratory Data Analysis Course Project 2
# Stephen Blatti

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data to get Baltimore's data.
baltimore_NEI <- NEI[NEI$fips == "24510",]

# Factor year
baltimore_NEI$year <- factor(baltimore_NEI$year, levels=c('1999', '2002', '2005', '2008'))

# plot3
# library(ggplot2)
png("plot3.png",width=480,height=480)

ggplot(data = baltimore_NEI,aes(x=year,y=Emissions,fill=type)) +
  theme_bw() +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  guides(fill=FALSE) +
  labs(x="Year", y=expression("PM "[2.5]*"  Emissions (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions by Type in Baltimore City, Maryland")
  )

dev.off()

