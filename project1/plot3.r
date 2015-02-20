rawDataFile <- "household_power_consumption.txt"

rawData <- read.csv(rawDataFile, sep=";",stringsAsFactors=FALSE,na.strings=c("?",""))
specificData <- subset(rawData,Date=="1/2/2007"|Date=="2/2/2007")

## reads and subsets data

png(filename="plot3.png",width=480,height=480,pointsize=12,bg="transparent")

## constructs plot to png file directly

specificData$DateTime <- as.POSIXct(paste(specificData$Date, specificData$Time), format="%d/%m/%Y %H:%M:%S")

## creating new variable DateTime to make things easier

plot(specificData$DateTime,specificData$Sub_metering_1,type="l", ylab="Energy sub metering", xlab= "")
lines(specificData$DateTime,specificData$Sub_metering_2,type="l",col="red")
lines(specificData$DateTime,specificData$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lwd=1)

## plot is made, inserting data in three steps according to colour

dev.off()

## graphics device closed