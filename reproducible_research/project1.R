library(ggplot2)
library(dplyr)
require(gridExtra)

data <- read.csv('activity.csv')
#data <- data[complete.cases(data), ]

steps_per_day <-aggregate(data$steps, by=list(data$date), FUN=sum)
mean_steps_per_day <- mean(steps_per_day$x, na.rm = TRUE)
median_steps_per_day <- median(steps_per_day$x, na.rm = TRUE)

q <- qplot(steps_per_day$x, main = 'Steps per day', xlab = 'Number of steps per day', geom = 'histogram', binwidth = 2500,col=I("blue"), fill=I("light blue"))
print(q)

five_min_intervals <- aggregate(data$steps, by=list(data$interval), FUN=mean, na.rm=TRUE)
names(five_min_intervals) <- c("Interval", "Average number of steps")
q1 <- qplot(five_min_intervals$Interval, five_min_intervals$`Average number of steps`, xlab='Interval number', ylab = 'Number of steps', main = 'Averaged number of steps in each 5 min interval', geom  = 'line')
print(q1)

# Missing values
missing_values <- sum(is.na(data))

for(i in unique(data$interval)){
  data_subsection <- data[data$interval == i, ]
  data_subsection$steps[is.na(data_subsection$steps)] <- floor(five_min_intervals$`Average number of steps`[five_min_intervals$Interval == i])
  data[data$interval == i, ] <- data_subsection
}

# Weekdays
data$weekend = chron::is.weekend(data$date)
weekday <- data[!data$weekend, ]
weekday <- aggregate(weekday$steps, by=list(weekday$interval), FUN=mean)
names(weekday) <- c("Interval", "Average number of steps")
q2 <- qplot(weekday$Interval, weekday$`Average number of steps`, xlab='Interval number', ylab = 'Number of steps', main = 'Averaged number of steps in each 5 min interval - Weekdays', geom = 'line')

# Weekend
weekend <- data[data$weekend, ]
weekend <- aggregate(weekend$steps, by=list(weekend$interval), FUN=mean)
names(weekend) <- c("Interval", "Average number of steps")
q3 <- qplot(weekend$Interval, weekend$`Average number of steps`, xlab='Interval number', ylab = 'Number of steps', main = 'Averaged number of steps in each 5 min interval - Weekends', geom = 'line')

q4 <- grid.arrange(q2, q3)