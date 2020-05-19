setwd("C:/Users/HEMANT/Documents/GIT/Exploratory_Analysis-Exp_2")
if(!file.exists("./exp_data")){dir.create("./exp_data")}
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url = url1,destfile = "./exp_data/exdata_data_NEI_data (1).zip")
unzip("exdata_data_NEI_data (1).zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("source_classification_Code.rds")
library(dplyr)
type.emissions <- summarise(group_by(filter(NEI,NEI$fips=="24510"),year,type),Emissions=sum(Emissions))
library(ggplot2)
qplot(factor(year),Emissions,data=type.emissions,color=type)
png("plot3.png",width = 420,height = 480)
dev.off()