library(RCurl)
library(rjson)

geo.connect <- function(address){
  
  URL <- URLencode(paste("http://maps.google.com/maps/api/geocode/json?address=", address, sep=""))
  URL.data <- fromJSON(getURL(URL))
  latitude <- URL.data$results[[1]]$geometry$location$lat
  longitude <- URL.data$results[[1]]$geometry$location$lng
  formatted_address <- URL.data$results[[1]]$formatted_address
  address.data <- data.frame(latitude = latitude, longitude = longitude, address = formatted_address)
  
  return(address.data)
  
}