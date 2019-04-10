## Coursera: Exploratory Data Analysis
## John Hopkins University
## Making Plot 3

downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = downloadURL, destfile = "./EDAWeek1data.zip", method = "curl")
rawData <- read.table(unz("EDAWeek1data.zip", "household_power_consumption.txt" ), header = TRUE, sep = ";", dec = ".", na.strings = "?")
RelevantDates <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
rm(rawData, downloadURL)

#Convert date-column to actual dates & add column with short form of weekday
RelevantDates$DateTime <- as.POSIXct(strptime(paste(RelevantDates$Date, RelevantDates$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
RelevantDates$Weekday <- format(RelevantDates$DateTime, "%a") #this turned out not to be relevant, but I got confused with the x-axis labeling

#make the plot
png("Plot3.png", width=480, height= 480)
with(RelevantDates, {
     plot(DateTime, Sub_metering_1, col = "black", lwd=1, type="l", xlab = "", ylab = "Energy sub metering")
     lines(DateTime, Sub_metering_2, col = "red", lwd=1, type="l")
     lines(DateTime, Sub_metering_3, col = "blue", lwd=1, type="l")
     legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })
dev.off()