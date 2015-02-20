rawDataFile <- "household_power_consumption.txt"

rawData <- read.csv(rawDataFile, sep=";",stringsAsFactors=FALSE,na.strings=c("?",""))
specificData <- subset(rawData,Date=="1/2/2007"|Date=="2/2/2007")

## reads and subsets data

png(filename="plot2.png",width=480,height=480,pointsize=12,bg="transparent")

## constructs plot to png file directly

specificData$DateTime <- as.POSIXct(paste(specificData$Date, specificData$Time), format="%d/%m/%Y %H:%M:%S")

## creating new variable DateTime to make things easier

plot(specificData$DateTime,specificData$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")

## plot is made

dev.off()

## graphics device closed