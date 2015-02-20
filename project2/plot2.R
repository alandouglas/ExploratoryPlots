NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

NEI_1999B <- filter(NEI, year==1999, fips == "24510")
NEI_2002B <- filter(NEI, year==2002, fips == "24510")
NEI_2005B <- filter(NEI, year==2005, fips == "24510")
NEI_2008B <- filter(NEI, year==2008, fips == "24510")

someEmissionsTotals <- c(sum(NEI_1999B$Emissions), sum(NEI_2002B$Emissions), sum(NEI_2005B$Emissions), sum(NEI_2008B$Emissions))

plot1Frame <- data.frame("Year"=c(1999,2002,2005,2008), "TotalEmissions"=someEmissionsTotals)

png(filename="plot2.png",width=480,height=480,pointsize=12)

## constructs plot to png file directly

plot(plot1Frame, type="b", main="Total Baltimore City PM25 Emissions",ylab="Total Emissions (tons)")

## plot is made

dev.off()

## graphics device closed