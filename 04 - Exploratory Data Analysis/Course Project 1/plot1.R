# Exploratory Data Analysis Course Project 1
# Stephen Blatti

# Read the data
data_hpc <- read.csv('household_power_consumption.txt', sep = ";", na.strings = "?", colClasses = 
                       c("character","character","numeric","numeric","numeric","NULL","numeric","numeric","numeric"))

# Convert the date and time
data_hpc$Time <- strptime(paste(data_hpc$Time), '%H:%M:%S')
data_hpc$Date <- as.Date(data_hpc$Date, format="%d/%m/%Y")

# Extract the data we want
data_hpc <- data_hpc[data_hpc$Date == '2007-02-01' | data_hpc$Date == '2007-02-02',]

# Plot 1
png('plot1.png', width=480, height=480)
with(data_hpc, hist(Global_active_power, col = "red", main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)"))
dev.off()