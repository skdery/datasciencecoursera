## This program uses data from the National Emissions Inventory (NEI) to answer the question:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
## 

## set working directory
setwd("~/Documents/Courses/Coursera/Exploratory Data Analysis/Assignment and Project/exdata-data-NEI_data")

# read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008?

# Select only data from Baltimore City
Balti.emissions <- NEI[NEI$fips=="24510",]

# group emissions by year
Balti.emissions.year <- aggregate(Emissions ~ year, Balti.emissions, sum)

png('plot2.png')
barplot(height=Balti.emissions.by.year$Emissions,
        names.arg=Balti.emissions.year$year,
        xlab="years", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in Baltimore City, '*
                          'Maryland from 1999 - 2008'), col ="blue")
dev.off()