NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

workingData <- filter(NEI, fips == "24510")

workingData2 <- aggregate(Emissions ~ year + type, data = workingData, sum)

png(filename="plot3.png",width=480,height=480,pointsize=12)

## constructs plot to png file directly

qplot(year, Emissions, data = workingData2, color=type)+geom_line()+labs(title="Total Baltimore PM25 Emissions by year and source type",y="Total Emissions (tons)")

## plot is made

dev.off()

## graphics device closed