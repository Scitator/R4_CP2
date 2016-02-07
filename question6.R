# data load

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}



# question 6

# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


# plot 6
library(ggplot2)

vehicles <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltimoreCity.vehicles <- aggregate(vehicles[c("Emissions")], list(type = vehicles$type, year = vehicles$year, zip = vehicles$fips), sum)

vehicles <- subset(NEI, fips == "06037" & type=="ON-ROAD")
losAngeles.vehicles <- aggregate(vehicles[c("Emissions")], list(type = vehicles$type, year = vehicles$year, zip = vehicles$fips), sum)

df <- rbind(baltimoreCity.vehicles, losAngeles.vehicles)

ggplot(data=df, aes(x = year, y = Emissions, fill = zip)) +
  geom_bar(stat="identity", position="dodge") +
  ggtitle("Motor Vehicle-Related Emissions in Baltimore (24510) \n vs Los Angeles (06037), MD: 1999-2008")
ggsave("plot6.png", width=8, height=8, dpi=120)

# answer 6

# Los Angeles has seen greater vehicle emissions change.