# data load

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}



# question 5

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?


# plot 5
library(ggplot2)

vehicles <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltimoreCity.vehicles <- aggregate(vehicles[c("Emissions")], list(type = vehicles$type, year = vehicles$year, zip = vehicles$fips), sum)

ggplot(data=baltimoreCity.vehicles, aes(x = year, y = Emissions, fill = type)) +
  geom_bar(stat="identity", position="dodge") +
  ggtitle("Motor Vehicle-Related Emissions in Baltimore, MD: 1999-2008")
ggsave("plot5.png", width=8, height=8, dpi=120)


# answer 5

# emissions have decreased.