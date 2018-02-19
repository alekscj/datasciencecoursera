library(dplyr)
library(stringr)
path <- "UCI HAR Dataset"
test_path <- "UCI HAR Dataset/test"
train_path <- "UCI HAR Dataset/train"
file_ext <- ".txt"

### Reading training and test data
x_train_path <- paste(c(train_path, "/X_train", file_ext), sep= "", collapse="")
y_train_path <- paste(c(train_path, "/y_train", file_ext), sep= "", collapse="")
x_test_path  <- paste(c(test_path, "/X_test", file_ext), sep= "", collapse="")
y_test_path  <- paste(c(test_path, "/y_test", file_ext), sep= "", collapse="" )
subj_inf_train_path <- paste(c(train_path, "/subject_train.txt"), sep= "", collapse="")
subj_inf_test_path <- paste(c(test_path, "/subject_test.txt"), sep= "", collapse="")


### Reading in the labels of the data
labels_path <- paste(path, "/features.txt", sep="", collapse="")
labels <- read.table(labels_path, colClasses = "character")
labels <- labels[[2]]

### Picking out the relevent names in the list of labels, 
### names containing mean() and std()
rel_names <- c(labels[grep("std()", labels)], labels[grep("mean()", labels)])

### Reading in the training and test data
x_train <- data.frame(read.table(x_train_path)) 
x_test  <- data.frame(read.table(x_test_path))
y_train <- data.frame(read.table(y_train_path))
y_test  <- data.frame(read.table(y_test_path))
subject_information_train <- data.frame(read.table(subj_inf_train_path))
subject_information_test <- data.frame(read.table(subj_inf_test_path))

### Adding the subject information to the training and test d ata
x_train <- cbind(x_train, subject_information_train)
x_test <- cbind(x_test, subject_information_test)


### Extracting only columns with information on the standard deviation and mean 
### of the measurements
rel_train_data <- cbind(x_train[, c(grep("std()", labels), grep("mean()", labels), ncol(x_train))], y_train)
rel_test_data  <- cbind(x_test[, c(grep("std()", labels), grep("mean()", labels), ncol(x_train))], y_test)


### Combining train and test data
relevant_data <- rbind(rel_test_data, rel_train_data)


### Exchanging the original names with more descriptive ones
rel_names_desc <- gsub("BodyBody", "Body", rel_names)
rel_names_desc <- gsub("BodyAcc", "Body_Acceleration.", rel_names_desc)
rel_names_desc <- gsub("BodyGyro", "Body_Gyroskope.", rel_names_desc)
rel_names_desc <- gsub("GravityAcc", "Gravity_Acceleration." , rel_names_desc) 
rel_names_desc <- gsub("^t", "Time_Domain." , rel_names_desc)
rel_names_desc <- gsub("^f", "Frequency_Domain.", rel_names_desc)
rel_names_desc <- gsub("Mag", "Euclidian_Magnitude.", rel_names_desc)
rel_names_desc <- gsub("-meanFreq()", "mean_frequency_value." , rel_names_desc)
rel_names_desc <- gsub("-mean()-", "mean_value." , rel_names_desc)
rel_names_desc <- gsub("-mean()", "mean_value." , rel_names_desc)
rel_names_desc <- gsub("-std", "standard_deviation." , rel_names_desc)
rel_names_desc <- gsub("Jerk", "Jerk." , rel_names_desc)
rel_names_desc <- gsub("-X", "X-direction" , rel_names_desc)
rel_names_desc <- gsub("-Y", "Y-direction" , rel_names_desc)
rel_names_desc <- gsub("-Z", "Z-direction" , rel_names_desc)
rel_names_desc <- gsub("[()]", "",rel_names_desc)
names(relevant_data) <- c(rel_names_desc, "Activity_Label", "Subject")


### Grouping the data by subject and activity: 

grouped_data <- relevant_data %>% group_by(Subject, Activity_Label)
summary <- summarize_all(grouped_data, mean)


### Writing the tidyed table to file
write.table(summary, file="tidy.txt")