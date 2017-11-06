# Exploratory Data Analysis Course Project 2
# Stephen Blatti

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data to get vehicle data.
veh <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
veh_SCC <- SCC[veh,]$SCC
veh_NEI <- NEI[NEI$SCC %in% veh_SCC,]


# Subset the vehicles NEI data to Baltimore's fip
balt_veh_NEI <- veh_NEI[veh_NEI$fips=="24510",]

# Factor year
balt_veh_NEI$year <- factor(balt_veh_NEI$year, levels=c('1999', '2002', '2005', '2008'))

# plot5
# library(ggplot2)
png("plot5.png",width=480,height=480)

ggplot(data = balt_veh_NEI,aes(x=year,y=Emissions) ) +
  theme_bw() +
  geom_bar(stat="identity", fill="blue") +
  labs(x="Year", y=expression("PM "[2.5]*"  Emissions (Tons)")) + 
  labs(title=expression("PM"[2.5]*"  Vehicle Emissions in Baltimore City, Maryland")
  )

dev.off()
