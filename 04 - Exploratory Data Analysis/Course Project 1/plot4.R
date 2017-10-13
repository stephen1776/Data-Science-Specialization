# Exploratory Data Analysis Course Project 1
# Stephen Blatti

# Read the data
data_hpc <- read.csv('household_power_consumption.txt', sep = ";", na.strings = "?", colClasses = 
                       c("character","character","numeric","numeric","numeric","NULL","numeric","numeric","numeric"))
# Extract the data we want
data_hpc$Date <- as.Date(data_hpc$Date, format="%d/%m/%Y")
data_hpc <- data_hpc[data_hpc$Date == '2007-02-01' | data_hpc$Date == '2007-02-02',]

# Make variable datetime
data_hpc$datetime <- strptime(paste(data_hpc$Date, data_hpc$Time), format = "%Y-%m-%d %H:%M:%S")


# Plot4
# Plot4_TopLeft
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
with(data_hpc, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
# Plot4_TopRight
with(data_hpc, plot(datetime, Voltage, type = "l"))
# Plot4_BottomLeft
with(data_hpc, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
par(new = TRUE)
with(data_hpc, plot(datetime, Sub_metering_2, type = "l", axes = FALSE, ylab = "", xlab = "", ylim=c(0.0,39.0), col = "red"))
par(new = TRUE)
with(data_hpc, plot(datetime, Sub_metering_3, type = "l", axes = FALSE, ylab = "", xlab = "", ylim=c(0.0,39.0), col = "blue"))
par(new = FALSE)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1, 1, 1))
# Plot4_BottomRight
with(data_hpc, plot(datetime, Global_reactive_power, type = "l"))
dev.off()