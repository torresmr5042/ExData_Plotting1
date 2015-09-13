##Rigoberto Torres
##Course: exdata-032
##Course Project #1: Plot#2
## 1. read and explore the data
library(datasets)

pdata<-read.table("./exdata-data/household_power_consumption.txt",
                    stringsAsFactors=FALSE,sep=";", header=FALSE,na.strings="?",
                    skip=66637,nrows=2880)
head(pdata)
tail(pdata)

## 2. Rename columns
colnames(pdata)<-c("Date", "Time", "Global_active_power", "Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")

## 3. Convert date to date format
pdata$DateTime<-paste(pdata$Date, pdata$Time)
pdata$DateTime <- strptime(pdata$DateTime, "%d/%m/%Y %H:%M:%S")


## 4. Create plot on screen device
with(pdata, plot(pdata$DateTime, pdata$Global_active_power, type="l", 
                 xlab = "", ylab = "Global Active Power (kilowatts"))

## 5. Copy my plot to a PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)

## 6. Close the PNG device!
dev.off()



