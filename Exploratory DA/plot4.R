## This program uses data from the National Emissions Inventory (NEI) to answer the question:

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999 to 2008?

## set working directory
setwd("~/Documents/Courses/Coursera/Exploratory Data Analysis/Assignment and Project/exdata-data-NEI_data")

# read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find coal combustion-related sources
coal.combustion <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal.combustion.sources <- SCC[coal.combustion,]

# Find emissions from coal combustion-related sources
emissions <- NEI[(NEI$SCC %in% coal.combustion.sources$SCC), ]

# group by year
emissions.year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

# plot using ggplot2

library(ggplot2)
png("plot4.png")
ggplot(emissions.year, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity",colour ="black", fill ="#FF9999") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from coal combustion-related sources")
dev.off()