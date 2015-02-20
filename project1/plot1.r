rawDataFile <- "household_power_consumption.txt"

rawData <- read.csv(rawDataFile, sep=";",stringsAsFactors=FALSE,na.strings=c("?",""))
specificData <- subset(rawData,Date=="1/2/2007"|Date=="2/2/2007")

## reads and subsets data

png(filename="plot1.png",width=480,height=480,pointsize=12,bg="transparent")

## constructs plot to png file directly

hist(specificData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## plot is made

dev.off()

## graphics device closed