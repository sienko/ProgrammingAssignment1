corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ##init the combined data frame
  cdf <- NULL
  
  ##get complete counts
  cc <- complete(directory)
  
  over_th <- subset(cc,nobs>threshold)
  ret <- numeric(length(over_th$id))
  
  idx = 1
  
  ##iterate through all the input ids
  for(file_num in over_th$id)
  {
    ff <- paste(directory, sprintf("/%03d",file_num), ".csv", sep="")
    ##print(ff)
    
    t <- read.csv(ff, header=TRUE, stringsAsFactors=FALSE)
    
    ##do correlation
    
    
    ret[idx]=cor(t$sulfate,t$nitrate,use="complete.obs")
    idx <- idx+1
  }
  ret
}