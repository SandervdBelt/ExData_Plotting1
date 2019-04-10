## Coursera: Exploratory Data Analysis
## John Hopkins University
## Making Plot 4

downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = downloadURL, destfile = "./EDAWeek1data.zip", method = "curl")
rawData <- read.table(unz("EDAWeek1data.zip", "household_power_consumption.txt" ), header = TRUE, sep = ";", dec = ".", na.strings = "?")
RelevantDates <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
rm(rawData, downloadURL)

#Convert date-column to actual dates & add column with short form of weekday
RelevantDates$DateTime <- as.POSIXct(strptime(paste(RelevantDates$Date, RelevantDates$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
RelevantDates$Weekday <- format(RelevantDates$DateTime, "%a") #this turned out not to be relevant, but I got confused with the x-axis labeling

#make the plot
png("Plot4.png", width=480, height= 480)
par(mfrow=c(2,2))
with(RelevantDates, {
  #top left
  plot(DateTime, Global_active_power, col = "black", lwd=1, type="l", xlab = "", ylab = "Global Active Power") 
  #top right, as I used mfrow rows are filled first
  plot(DateTime, Voltage, col = "black", lwd=1, type="l", xlab = "datetime", ylab = "Voltage") 
  #bottom left
  plot(DateTime, Sub_metering_1, col = "black", lwd=1, type="l", xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = "red", lwd=1, type="l")
    lines(DateTime, Sub_metering_3, col = "blue", lwd=1, type="l")
    legend("topright", bty = "n", lty = c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #bottom right
  plot(DateTime, Global_reactive_power, col = "black", lwd=1, type="l", xlab = "datetime", ylab = "Global_reactive_power")
  })
dev.off()