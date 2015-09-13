##Rigoberto Torres
##Course: exdata-032
##Course Project #1: Plot#3
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
with(pdata, plot(pdata$DateTime, pdata$Sub_metering_1, type="l", 
                 xlab = "", ylab = "Energy sub metering"))

with(pdata, 
     lines(pdata$DateTime, pdata$Sub_metering_2, type="l", col="red"),
)

with(pdata, 
     lines(pdata$DateTime, pdata$Sub_metering_3, type="l", col="blue"),
)

with(pdata, 
     legend("topright", 
            lty=c(1,1,1), # gives the legend appropriate symbols (lines)
            lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"),
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            cex=0.8, xjust=0)
)

## 5. Copy my plot to a PNG file
dev.copy(png, file = "plot3.png", width=480, height=480)

## 6. Close the PNG device!
dev.off()



