NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

NEI_1999 <- filter(NEI, year==1999)
NEI_2002 <- filter(NEI, year==2002)
NEI_2005 <- filter(NEI, year==2005)
NEI_2008 <- filter(NEI, year==2008)

someEmissionsTotals <- c(sum(NEI_1999$Emissions), sum(NEI_2002$Emissions), sum(NEI_2005$Emissions), sum(NEI_2008$Emissions))

plot1Frame <- data.frame("Year"=c(1999,2002,2005,2008), "TotalEmissions"=someEmissionsTotals)

png(filename="plot1.png",width=480,height=480,pointsize=12)

## constructs plot to png file directly

plot(plot1Frame, type="b", main="Total US PM25 Emissions", ylab="Total Emissions (tons)")

## plot is made

dev.off()

## graphics device closed