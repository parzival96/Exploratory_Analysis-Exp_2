setwd("C:/Users/HEMANT/Documents/GIT/Exploratory_Analysis-Exp_2")
if(!file.exists("./exp_data")){dir.create("./exp_data")}
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url = url1,destfile = "./exp_data/exdata_data_NEI_data (1).zip")
unzip("exdata_data_NEI_data (1).zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("source_classification_Code.rds")
library(ggplot2)
SCC.vehicle <- SCC[grep("[Vv]eh",SCC$Short.Name),]
NEI.vehicle <- subset(NEI,NEI$SCC %in% SCC.vehicle$SCC)
tot.vehicle.emissions <- summarise(group_by(NEI.vehicle,year),emissions=sum(Emissions))
plot5 <- qplot(factor(year),emissions/1000000,data = tot.vehicle.emissions,xlab = "year",ylab = "Emission in million tonnes")
png("plot5",width = 480,height = 480)
dev.off()

