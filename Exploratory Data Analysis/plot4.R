#setwd("datasciencecoursera/Exploratory Data Analysis/")
### Plotting the three submetering measurements as a funciton of time from the household power consumption dataset,
### only using the two given days 1/2/2007 and 2/2/2007, and saving the resulting 
### histogram to plot1.png

#rel_data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
household_power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

rel_data <- split(household_power_consumption, household_power_consumption$Date)
rel_data <- rbind(rel_data$`1/2/2007`, rel_data$`2/2/2007`)
#split_data <- split(household_power_consumption, household_power_consumption$Date)


### Converting from given label to date format in R and splitting the data in weekdays: 


#converted_date_time <- vector(mode = "list", length = length(rel_data$Date))
rel_data$DateTime <- strptime(paste(rel_data$Date, rel_data$Time), format = "%d/%m/%Y %H:%M:%S")
