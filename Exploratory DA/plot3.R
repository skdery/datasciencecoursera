## This program uses data from the National Emissions Inventory (NEI) to answer the question:
 
## Of the four types of sources indicated by the type (point, nonpoint, onroad,nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008?

## set working directory
setwd("~/Documents/Courses/Coursera/Exploratory Data Analysis/Assignment and Project/exdata-data-NEI_data")

# read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balti.emissions <- NEI[NEI$fips=="24510",]

# Group data by year and type of the source
Balti.emissions.aggr <- aggregate(Emissions ~ year + type, data=Balti.emissions, FUN=sum)

# Plot using ggplot2

library(ggplot2)
png("plot3.png", height=480, width=680)
ggplot(Balti.emissions.aggr, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") + theme(legend.position="bottom")+
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City by source types and year", sep="")))
dev.off()