corr <- function(directory="C:/Users/sara.jonvik/Documents/datasciencecoursera/specdata/", threshold = 0) { 
  ### Calculates the correlation between sulfate and nitrate
  ### polution for monitors with a number of complete observations 
  ### a threshold
  
  threshold = 150
  id <- 1:332
  correlated <- numeric()
  directory="C:/Users/sara.jonvik/Documents/datasciencecoursera/specdata/"
  count <- 0
  for (i in id){
    
    file <- paste(directory, formatC(id[[i]], width=3, flag="0"), ".csv", sep="")
    data <- read.csv(file)
    
    good_data    <- complete.cases(data)
    num_complete <-  sum(good_data)
    cleaned_data <- data[good_data,]
    
    if ( num_complete > threshold){
      
      
      sulfate <- cleaned_data[,2]
      nitrate <- cleaned_data[,3]
      
      correlated[count] <- cor(sulfate, nitrate)
      count <- count+1
    } 
    
  }
  
  return(correlated)
  
}