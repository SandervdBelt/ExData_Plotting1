## Coursera: Exploratory Data Analysis
## John Hopkins University
## Making Plot 2

downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = downloadURL, destfile = "./EDAWeek1data.zip", method = "curl")
rawData <- read.table(unz("EDAWeek1data.zip", "household_power_consumption.txt" ), header = TRUE, sep = ";", dec = ".", na.strings = "?")
RelevantDates <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
rm(rawData, downloadURL)

#Convert date-column to actual dates & add column with short form of weekday
RelevantDates$DateTime <- as.POSIXct(strptime(paste(RelevantDates$Date, RelevantDates$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
RelevantDates$Weekday <- format(RelevantDates$DateTime, "%a") #this turned out not to be relevant, but I got confused with the x-axis labeling

#make the plot
png("Plot2.png", width=480, height= 480)
plot(RelevantDates$DateTime, RelevantDates$Global_active_power, lwd=1, ylab = "Global Active Power Output (kilowatts)", xlab="", type="l")
dev.off()