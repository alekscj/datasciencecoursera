rankall <- function(outcome_name, rank = "best"){
    
    library(plyr)
    # Takes two arguments and checks the validity of both: 
    # abbrv_name = abbreviated name of a state
    # outcome_name = name of outcome (ie. pneumonia, heart failure, heart attack, example: Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    
    ## Reads the outcome-of-care-measures.csv and returns the name of the hospital (provided by the name.hospital variable) with the 
    ## lowest 30-day mortality rate (lowest_mort) for the specified outcome and state
    ## If there is a tie between the lowest mortality rates then the hospital are sorted in alphabetical order, 
    ## so the hospital at the top of the alphabetical sorting is returned
    
    # Relevant outcomes by column numbers: "heart attack"=11, "heart failure"=17, "pneumonia"=23
    
    if(rank == "worst" || rank == "Worst") {rank_num <- -1}
    else if(rank == "best" || rank == "Best") {rank_num <- 1}
    else{ rank_num <- rank}
    
    outcome <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available")
    
    if (outcome_name == "heart attack" || outcome_name == "Heart attack" || outcome_name == "Heart Attack"){
        column_name = outcome_name
        outcome_name = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        column <- 11
    }
    else if (outcome_name == "heart failure"|| outcome_name == "Heart failure" || outcome_name == "Heart Failure") {
        column_name = outcome_name
        outcome_name = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        column <- 17
    }
    else if (outcome_name == "pneumonia" || outcome_name == "Pneumonia"){
        column_name = outcome_name
        outcome_name = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        column <- 23
    }
    else {
        print("Missing valid outcome. Routine only set up for Heart Attack, Heart Failure or Pneumonia. ")
        print("Exiting........")
        on.exit()
    }
    
    
        
        outcome        <- data.frame(outcome[, 2], outcome[, 7], outcome[[outcome_name]])
        names(outcome) <- c("Hospital name", "State", column_name)
        
        
        state_data   <- split(outcome, outcome$State)

        
        if (class(rank) == "character") {
            print(paste("Hospital with with", as.character(rank), "rank in mortality rate for ", column_name))
        }
        else {
            print(paste("Hospital with with rank", as.character(rank), "in mortality rate for ", column_name))
        }
        
        ranked_data <- data.frame()
        for(i in 1:50){
            rel_state    <- data.frame(state_data[[i]])

            arrange_data <- arrange(rel_state, rel_state[[3]], rel_state[[2]])
            good_data    <- complete.cases(arrange_data)
            cleaned_data <- arrange_data[good_data,]
            
            
            #print(tail(cleaned_data, 10))

            if(i == 1){
            
                if(rank == "worst") {
                    #print(tail(cleaned_data[, 1:2],1)) 
                    ranked_data <- tail(cleaned_data[, 1:2], 1)
                }
                else {
                    ranked_data <- cleaned_data[rank_num, 1:2]
                    print(cleaned_data[rank_num,1:2])
                }
            }
            else {
                if(rank == "worst") {
                    #print(tail(cleaned_data[, 1:2],1)) 
                    rbind(ranked_data, tail(cleaned_data[, 1:2],1))
                }
                else {
                    rbind(ranked_data, cleaned_data[rank_num, 1:2])
                    print(cleaned_data[rank_num,1:2])
                }   
            }
            
            
        }
    
        return(ranked_data)

        
}