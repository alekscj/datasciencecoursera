#data <- readRDS("summarySCC_PM25.rds")
#Source_classification <- readRDS("Source_Classification_Code.rds")

#Checking the data 
print(head(data))
emission_summ <- summary(data$Emissions, na.rm = TRUE)

by_year <- split(data, data$year)


## Plot of the total PM2.5 emission from all sources for 
## each of the years 1999, 2002, 2005, and 2008


## Creating data frames for the data in each year for easier plotting. 
data_1999 <- data.frame(by_year[[1]])
data_2002 <- data.frame(by_year[[2]])
data_2005 <- data.frame(by_year[[3]])
data_2008 <- data.frame(by_year[[4]])

tot_em_1999 <- sum(data_1999$Emissions, na.rm=TRUE) 
tot_em_2002 <- sum(data_2002$Emissions, na.rm=TRUE)
tot_em_2005 <- sum(data_2005$Emissions, na.rm=TRUE)
tot_em_2008 <- sum(data_2008$Emissions, na.rm=TRUE)

png("plot1.png", width=480, height=480)
plot(c(1999, 2002, 2005, 2008), c(tot_em_1999, tot_em_2002, tot_em_2005, tot_em_2008)/10^6, xlab = "Year", ylab = "Total Emission in billion tons", main="Total emission of all sources", pch=19, type="b")
dev.off()


