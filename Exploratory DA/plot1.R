## This program uses data from the National Emissions Inventory (NEI) to answer the question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.

## set working directory
setwd("~/Documents/Courses/Coursera/Exploratory Data Analysis/Assignment and Project/exdata-data-NEI_data")

# read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum the total PM2.5 Emission for each year

total.emissions <- aggregate(Emissions ~ year, NEI, sum)

# plot the graph showing the total PM2.5 emission

png('plot1.png')
plot(total.emissions$year, total.emissions$Emissions,
     xlab="years", ylab=expression('total PM'[2.5]*' emission'),
     main=expression('Total PM'[2.5]*' emissions in the United States, 1999-2008'), type = "l", col ="blue")

dev.off()
