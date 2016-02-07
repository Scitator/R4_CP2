# data load

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}



# question 4

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


# plot 4
library(ggplot2)

SCC.coalSubset <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.coalSubset <- NEI[NEI$SCC %in% SCC.coalSubset$SCC, ]
ggplot(data=NEI.coalSubset, aes(x=year, y=Emissions, fill = type)) + 
  geom_bar(stat = "identity", position="dodge") + 
  ggtitle("U.S. Coal Combustion-Related Emissions: 1999-2008")
ggsave("plot4.png", width=8, height=8, dpi=120)


# answer 4

# Point-source coal emissions have decreased.