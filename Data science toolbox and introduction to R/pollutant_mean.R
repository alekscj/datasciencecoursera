pollutant_mean <- function(directory="C:/Users/sara.jonvik/Documents/datasciencecoursera/specdata/", pollutant, id=1:332) {
  ## Directory = Directory containing the data
  ## Pollutant = Either sulfate or nitrate 
  ## id = Id of monitor
  pol_array <- c()
  if (length(id) > 1){
    for (i in 1:length(id)) {
  
    
      
      file <- paste(directory, formatC(id[i], width=3, flag="0"), ".csv", sep="")
      #print(file)
      data <- read.csv(file)
      #print(data[, pollutant])
      
      
      good_data    <- complete.cases(data)
      cleaned_data <- data[good_data,]
      #print(cleaned_data[, pollutant])
      
      #pol_array[i] = mean(cleaned_data[, pollutant])
      
      pol_array <- c(pol_array,cleaned_data[, pollutant])
      print(paste("id: ", id[i], "| mean: ",pol_array[i]))
      #print(pol_array)
      }
  }
  else {
    
    file <- paste(directory, formatC(id, width=3, flag="0"), ".csv", sep="")
    print(file)
    data <- read.csv(file)
    #print(data[, pollutant])
    
    good_data    <- complete.cases(data)
    cleaned_data <- data[good_data,]
    #print(cleaned_data[, pollutant])
      
    pol_array <- c(pol_array,cleaned_data[, pollutant])
    print(paste("id: ", id, "| mean: ",pol_array))
      
  }
  
  print(pol_array)
  print(mean(pol_array))

}