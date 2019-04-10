## Coursera: Exploratory Data Analysis
## John Hopkins University
## Making Plot 1

downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = downloadURL, destfile = "./EDAWeek1data.zip", method = "curl")
rawData <- read.table(unz("EDAWeek1data.zip", "household_power_consumption.txt" ), header = TRUE, sep = ";", dec = ".", na.strings = "?")
RelevantDates <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
rm(rawData, downloadURL)

#create Plot1
png("Plot1.png", width=480, height= 480)
hist(RelevantDates$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
