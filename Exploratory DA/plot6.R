## This program uses data from the National Emissions Inventory (NEI) to answer the question:

## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips =="06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## set working directory
setwd("~/Documents/Courses/Coursera/Exploratory Data Analysis/Assignment and Project/exdata-data-NEI_data")

# read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Get Baltimore emissions from motor vehicle sources
Balti.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Balti.emissions.aggr <- aggregate(Emissions ~ year, data=Balti.emissions, FUN=sum)

# Get Los Angeles emissions from motor vehicle sources
la.emissions <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
la.emissions.aggr <- aggregate(Emissions ~ year, data=la.emissions, FUN=sum)

Balti.emissions.aggr$County <- "Baltimore City, MD"
la.emissions.aggr$County <- "Los Angeles County, CA"
both.emissions <- rbind(Balti.emissions.aggr, la.emissions.aggr)

# plot using ggplot2
library(ggplot2)
png("plot6.png")
ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County)) +
  geom_bar(stat="identity") + theme(legend.position="bottom")+
  facet_grid(County  ~ ., scales="free") +
  ylab("total emissions (tons)") + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles"))
dev.off()

