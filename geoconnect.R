library(RCurl)
library(rjson)

geo.connect <- function(address){
  
  URL <- URLencode(paste("http://maps.google.com/maps/api/geocode/json?address=", address, sep=""))
  URL.data <- fromJSON(getURL(URL))
    if (URL.data$status == "OK"){
      latitude <- URL.data$results[[1]]$geometry$location$lat
      longitude <- URL.data$results[[1]]$geometry$location$lng
      formatted_address <- URL.data$results[[1]]$formatted_address
    }else{
      latitude <- 0
      longitude <- 0
      formatted_address <- "ERROR"
    } 
  address.data <- data.frame(latitude = latitude, longitude = longitude, address = formatted_address)
  
  return(address.data)
}