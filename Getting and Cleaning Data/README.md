### Getting and Cleaining Data

# README describing the steps taken to clean and order the data given in the Course project for "Getting and Cleaning Data" in Coursera's Data Science specialization

Packages used: dplyr, installed using install.packages("dplyr")

The dataset given is the Human Activity Recognition Using Smartphones from
UCI. It is a multivariate time series set used as classification and clustering
examples in machine learning, and therefore already split in a training and test
sett. A description of the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and the dataset itself downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  * The splitting between training and test was removed to create a complete dataset,
and merged to one complete set.
  * The labels corresponding to each data point (each row) was combined with the merged data set
  * The data containing information on the mean and
standard deviation was extracted to a separate set
  * The labels of the data was exchanged with more descriptive names.
  * A second dataset was constructed from the average values of all other variables

The R-code performing the steps above can be found in run_analysis.R

The descriptive names were constructed with _ as separators between words and . as
separators between "information", in a way. For example,  

Time_Domain.Body_Acceleration.standard_deviation.X-direction

gives the standard deviation of the body acceleration given in the time domain
(not fourier transformed) in the X-direction. All names in the tidyed.txt file is
given in this way, constructed using regular expressions and the gsub-function in
R (see line 34 to 50 in code)
