# Read data
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset useful data
plotdata <- subset(dataset, Date == c("1/2/2007", "2/2/2007"))
# Convert Date and Time variables to Date/Time classes
SetTime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Complete tidy data
finalData <- cbind(SetTime, plotdata)
# plot4
# Divide plotting area to 4
par(mfrow = c(2,2), mar = c(2.5,2.2,1,0.5), oma = c(1,1,0,0))
par(cex.axis = 0.8, cex.lab = 0.8, mgp = c(1.5, 0.5, 0))
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
legend("top", lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       cex = 0.8, max(finalData$SetTime)-2)
# forth plot
plot(finalData$SetTime, finalData$Global_reactive_power, type = "l", 
     xlab = "datetime", 
     ylab = "Global reactive power")
# Save to PNG files
png(filename = "plottest.png", width = 480, height = 480, units = "px")
dev.off()