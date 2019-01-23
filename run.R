# Set system language
Sys.setlocale("LC_TIME", "English")
# Read data
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset useful data
plotdata <- subset(dataset, Date == c("1/2/2007", "2/2/2007"))
# Convert Date and Time variables to Date/Time classes
SetTime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Complete tidy data
finalData <- cbind(SetTime, plotdata)

# plot1
hist(finalData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

# plot2
plot(finalData$SetTime, finalData$Global_active_power, col = "black", type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# plot3
plot(finalData$SetTime, finalData$Sub_metering_1, col = "black", type = "l",
     xlab = "",
     ylab = "Engergy sub metering")
points(finalData$SetTime, finalData$Sub_metering_2, col = "red", type = "l")
points(finalData$SetTime, finalData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

# plot4
# Divide plotting area to 4
par(mfrow = c(2,2))
# first plot
plot(finalData$SetTime, finalData$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power")
# second plot
plot(finalData$SetTime, finalData$Voltage, type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")
# third plot
plot(finalData$SetTime, finalData$Sub_metering_1, col = "black", type = "l",
     xlab = "",
     ylab = "Engergy sub metering")
points(finalData$SetTime, finalData$Sub_metering_2, col = "red", type = "l")
points(finalData$SetTime, finalData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
# forth plot
plot(finalData$SetTime, finalData$Global_reactive_power, type = "l", 
     xlab = "datetime", 
     ylab = "Global reactive power")