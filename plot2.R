setwd("C:/Users/HEMANT/Documents/GIT/Exploratory_Analysis-Exp_2")
if(!file.exists("./exp_data")){dir.create("./exp_data")}
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url = url1,destfile = "./exp_data/exdata_data_NEI_data (1).zip")
unzip("exdata_data_NEI_data (1).zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("source_classification_Code.rds")
library(dplyr)
baltimore.emissions <- summarise(group_by(filter(NEI,NEI$fips=="24510"),year),Emissions=sum(Emissions))
plot2 <- barplot(height = baltimore.emissions$Emissions/1000,names.arg = baltimore.emissions$year,
                 xlab = "years",ylab = "emissions in kilo tonnes",main = "Total emission from 1999 to 2008",
                 col = c("red","yellow","green","blue"),ylim = c(0,3.5))
png("plot2.png")
dev.off()
