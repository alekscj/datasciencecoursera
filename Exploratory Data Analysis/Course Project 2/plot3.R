data <- readRDS("summarySCC_PM25.rds")
Source_classification <- readRDS("Source_Classification_Code.rds")

#Checking the data 
print(head(data))
emission_summ <- summary(data$Emissions, na.rm = TRUE)

by_county <- split(data, data$fips)
baltimore <- by_county$"24510"
baltimore_by_year <- split(baltimore, baltimore$year)

## Plot of the total PM2.5 emission from all sources for 
## each of the years 1999, 2002, 2005, and 2008
baltimore_type <- split(baltimore_by_year, baltimore_by_year$type)

png("plot3.png", width=480, height=480)
for(i in 1:4){
    type <- baltimore_type[[i]]
    data_1999 <- data.frame(type[[1]])
    data_2002 <- data.frame(type[[2]])
    data_2005 <- data.frame(type[[3]])
    data_2008 <- data.frame(type[[4]])
    
    tot_em_1999 <- sum(data_1999$Emissions, na.rm=TRUE) 
    tot_em_2002 <- sum(data_2002$Emissions, na.rm=TRUE)
    tot_em_2005 <- sum(data_2005$Emissions, na.rm=TRUE)
    tot_em_2008 <- sum(data_2008$Emissions, na.rm=TRUE)
    plot(c(1999, 2002, 2005, 2008), c(tot_em_1999, tot_em_2002, tot_em_2005, tot_em_2008)/10^6, xlab = "Year", ylab = "Total Emission in billion tons", main="Total emission of all sources", col=i, pch=19, type="b")
    
    
}

dev.off()