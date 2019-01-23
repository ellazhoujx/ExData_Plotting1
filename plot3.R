# Read data
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset useful data
plotdata <- subset(dataset, Date == c("1/2/2007", "2/2/2007"))
# Convert Date and Time variables to Date/Time classes
SetTime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Complete tidy data
finalData <- cbind(SetTime, plotdata)
# plot3
plot(finalData$SetTime, finalData$Sub_metering_1, col = "black", type = "l",
     xlab = "",
     ylab = "Engergy sub metering")
points(finalData$SetTime, finalData$Sub_metering_2, col = "red", type = "l")
points(finalData$SetTime, finalData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
# Save to PNG files
png(filename = "plot3.png", width = 480, height = 480, units = "px")
dev.off()