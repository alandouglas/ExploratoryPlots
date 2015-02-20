NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

## While an ambiguous question, after examing the data set, decision was made
## to use the subset of data corresponding to that which contains the substring 'coal'
## in the EI.Sector variable of the SCC dataset. All of the subsequent data selected is; by observation,
## also labelled as being related to fuel consumption.

SCC_Coal2 <- SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE), ]

SCCs <- as.character((SCC_Coal$SCC))

NEI_Coal <- filter(NEI, SCC %in% SCCs)

NEI_Coal2 <- aggregate(Emissions ~ year, data=NEI_Coal, sum)

png(filename="plot4.png",width=480,height=480,pointsize=12)

## constructs plot to png file directly

g <- ggplot(NEI_Coal2, aes(year, Emissions))
g1 <- g + geom_point() + geom_line()
g2 <- g1 + labs(title="Total US PM25 Emissions related to coal combustion, by year")
g3 <- g2 + labs(y="Total Emissions (tons)")

print(g3)

## plot is made

dev.off()

## graphics device closed


