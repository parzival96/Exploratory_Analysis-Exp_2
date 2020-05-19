setwd("C:/Users/HEMANT/Documents/GIT/Exploratory_Analysis-Exp_2")
if(!file.exists("./exp_data")){dir.create("./exp_data")}
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url = url1,destfile = "./exp_data/exdata_data_NEI_data (1).zip")
unzip("exdata_data_NEI_data (1).zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("source_classification_Code.rds")
library(dplyr)
total.emissions <- summarise(group_by(NEI,year),Emissions=sum(Emissions))
plot1 <- barplot(height = total.emissions$Emissions/1000000,names.arg = total.emissions$year,xlab = "year",ylab = "emissions in million tonnes",
                 main = "Total emission from 1999 to 2008",col = c("red","green","blue","yellow"),ylim = c(0,8))
png("plot1.png",width = 480,height = 480)
dev.off()