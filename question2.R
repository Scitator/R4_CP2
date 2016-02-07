# data load

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}



# question 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.


# plot 2

png('plot2.png')
baltimoreCity.Maryland <- subset(NEI, NEI$fips == "24510")
totalEmissionsBaltimore<-tapply(baltimoreCity.Maryland$Emissions, baltimoreCity.Maryland$year, sum)
barplot(totalEmissionsBaltimore, main = "Total Emissions in the Baltimore City, Maryland by Year", xlab="Year", ylab="Emissions")
dev.off()



# answer 2

# Yes. Total emissions from PM2.5 have decreased in the range 1999-2008.