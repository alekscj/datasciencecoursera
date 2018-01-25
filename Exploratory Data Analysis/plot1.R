#setwd("datasciencecoursera/Exploratory Data Analysis/")
houshold_power_consumption <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")


### Plotting a histogram of the frequency of global active power in the households

global_active <- houshold_power_consumption$Global_active_power

hist(global_active, col="red", xlab="")