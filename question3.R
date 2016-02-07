# data load

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}



# question 3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.


# plot 3
library(ggplot2)

baltimoreCity.Maryland <- subset(NEI, NEI$fips == "24510")
ggplot(data=baltimoreCity.Maryland, aes(x=year, y=Emissions, fill=type)) +    
  geom_bar(stat="identity", position="dodge") +
  ggtitle("Baltimore, Emission by Type: 1999-2008")
ggsave("plot3.png", width=8, height=8, dpi=120)



# answer 3

# Nonpoint, on-road and non-road emission - decreased.
# Point emissions - increased to 2005.