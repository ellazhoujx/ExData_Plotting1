# Read data
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset useful data
plotdata <- subset(dataset, Date == c("1/2/2007", "2/2/2007"))
# Convert Date and Time variables to Date/Time classes
SetTime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Complete tidy data
finalData <- cbind(SetTime, plotdata)
# plot2
plot(finalData$SetTime, finalData$Global_active_power, col = "black", type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
# Save to PNG files
png(filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()