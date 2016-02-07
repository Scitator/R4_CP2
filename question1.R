# data load

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}



# question 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.



# plot 1

png('plot1.png')
totalEmissionsNEI <- tapply(NEI$Emissions, NEI$year, sum)
barplot(totalEmissionsNEI, main = "Total Emissions by Year", xlab="Year", ylab="Emissions")
dev.off()



# answer 1

# Yes. Total emissions from PM2.5 have decreased in the range 1999-2008.