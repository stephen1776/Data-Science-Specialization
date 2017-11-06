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
balt_veh_NEI$city <- "Baltimore City"

la_veh_NEI <- veh_NEI[veh_NEI$fips=="06037",]
la_veh_NEI$city <- "Los Angeles"

# Factor year
balt_veh_NEI$year <- factor(balt_veh_NEI$year, levels=c('1999', '2002', '2005', '2008'))
la_veh_NEI$year <- factor(la_veh_NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Combine data
com_NEI <- rbind(balt_veh_NEI,la_veh_NEI)

# plot6
# library(ggplot2)
png("plot6.png",width=480,height=480)

ggplot(data = com_NEI,aes(x=year,y=Emissions) ) +
  theme_bw() +
  geom_bar(stat="identity", fill="blue") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="Year", y=expression("PM "[2.5]*"  Emissions (Tons)")) + 
  labs(title=expression("PM"[2.5]*"  Vehicle Emissions in Baltimore & LA")
  )

dev.off()
