#setwd("datasciencecoursera/Exploratory Data Analysis/")

### 
### only using the two given days 1/2/2007 and 2/2/2007, and saving the resulting 
### histogram to plot1.png

household_power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

split_data <- split(household_power_consumption, household_power_consumption$Date)
rel_data <- rbind(split_data$`1/2/2007`, split_data$`2/2/2007`)


### Converting from given label to date format in R and splitting the data in weekdays: 

#date_converted <- weekdays(as.Date(rel_data$Date))
time_converted <- strptime( as.character(rel_data$Time), "%H:%M:%S")
time_converted <- format(time_converted, "%H:%M:%S")
#rel_data <- cbind(date_converted, time_converted, rel_data[, 3:9])
#weekday_data <- split(rel_data,rel_data$date_converted)
