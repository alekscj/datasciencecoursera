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

png("plot4.png")
par(mfrow=c(2,2))

plot(rel_data$DateTime, rel_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" " )

plot(rel_data$DateTime, rel_data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(rel_data$DateTime, rel_data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=" " )
lines(rel_data$DateTime, rel_data$Sub_metering_2, col="red")
lines(rel_data$DateTime, rel_data$Sub_metering_3, col="blue")
legend("topright", c(legend="Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1, col=c("black", "red", "blue"))

plot(rel_data$DateTime, rel_data$Global_reactive_power, type="l", ylab="Global Active Power (kilowatts)", xlab="datetime" )

dev.off()