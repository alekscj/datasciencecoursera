#setwd("datasciencecoursera/Exploratory Data Analysis/")

### Plotting a histogram of the frequency of global active power in the households
### only using the two given days 1/2/2007 and 2/2/2007, and saving the resulting 
### histogram to plot1.png

household_power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

split_data <- split(household_power_consumption, household_power_consumption$Date)
rel_data <- rbind(split_data$`1/2/2007`, split_data$`2/2/2007`)


global_active <- rel_data$Global_active_power

png("plot1.png")
hist(global_active, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
