NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

## While an ambiguous question, after examing the data set, decision was made
## to use the subset of data corresponding to that which contains the substring 'mobile'
## in the EI.Sector variable of the SCC dataset.

SCC_Motor <-  SCC[grep("mobile", SCC$EI.Sector, ignore.case=TRUE), ]

SCCs <- as.character((SCC_Motor$SCC))

NEI_Motor <- filter(NEI, SCC %in% SCCs)

NEI_Motor2 <- filter(NEI_Motor, fips == "24510")

NEI_Motor3 <- aggregate(Emissions ~ year, data=NEI_Motor2, sum)

png(filename="plot5.png",width=480,height=480,pointsize=12)

## constructs plot to png file directly

g <- ggplot(NEI_Motor3, aes(year, Emissions))
g1 <- g + geom_point() + geom_line()
g2 <- g1 + labs(title="Total Baltimore PM25 Emissions related to motor vehicles, by year")
g3 <- g2 + labs(y="Total Emissions (tons)")

print(g3)

## plot is made

dev.off()

## graphics device closed
