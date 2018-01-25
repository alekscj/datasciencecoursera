complete <- function(directory="C:/Users/sara.jonvik/Documents/datasciencecoursera/specdata/", id=1:332) {
  
  #### Returns number of complete cases in the files in input direcotory with input id

  
    num_complete <- list()
    for (i in 1:length(id)){
      #print(id[[1]])
      file <- paste(directory, "/", formatC(id[[i]], width=3, flag="0"), ".csv", sep="")
      #print(directory)
      #print(file)
      data <- read.csv(file)
      
      good_data    <- complete.cases(data)
      num_complete[i] <-  sum(good_data)
      
    }
    
    complete_data <- cbind(id, num_complete)
    colnames(complete_data) <- c("id", "nobs")
    #complete_data <- as.data.frame(complete_data)
    return(complete_data)
  
}
