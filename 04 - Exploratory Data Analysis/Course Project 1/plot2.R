# Exploratory Data Analysis Course Project 1
# Stephen Blatti

# Read the data
data_hpc <- read.csv('household_power_consumption.txt', sep = ";", na.strings = "?", colClasses = 
                       c("character","character","numeric","numeric","numeric","NULL","numeric","numeric","numeric"))
# Extract the data we want
data_hpc$Date <- as.Date(data_hpc$Date, format="%d/%m/%Y")
data_hpc <- data_hpc[data_hpc$Date == '2007-02-01' | data_hpc$Date == '2007-02-02',]

# Make variable DateTime
data_hpc$DateTime <- strptime(paste(data_hpc$Date, data_hpc$Time), format = "%Y-%m-%d %H:%M:%S")


# Plot2
png('plot2.png', width=480, height=480)
with(data_hpc, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()