complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ##init the combined data frame
  cdf <- NULL
  nobs <- numeric(length(id))
  ret <- data.frame(id,nobs)
  
  idx = 1
  
  ##iterate through all the input ids
  for(file_num in id)
  {
    ff <- paste(directory, sprintf("/%03d",file_num), ".csv", sep="")
    ##print(ff)
    
    t <- read.csv(ff, header=TRUE, stringsAsFactors=FALSE)
    
    ##new column if !is.na
    
    t2 <- cbind(t,iscomplete=((!is.na(t$nitrate))*(!is.na(t$sulfate))))
    
    ret[idx,"nobs"]=sum(t2$iscomplete)
    idx <- idx+1
  }
  ret
}