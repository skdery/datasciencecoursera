## This program uses data from the National Emissions Inventory (NEI) to answer the question:
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## set working directory
setwd("~/Documents/Courses/Coursera/Exploratory Data Analysis/Assignment and Project/exdata-data-NEI_data")

# read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Get Baltimore emissions from motor vehicle sources
Balti.emissions1 <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Balti.emissions1.aggr <- aggregate(Emissions ~ year, data=Balti.emissions1, FUN=sum)

# plot using ggplot2

library(ggplot2)
png("plot5.png")
ggplot(Balti.emissions1.aggr, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity", ,colour ="black", fill ="#FF9999") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City, 1999–2008")
dev.off()