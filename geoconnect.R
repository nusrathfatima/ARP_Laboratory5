library(RCurl)
library(rjson)


geo.connect <- function(address){
  
  addresses <- data.frame(latitude = NULL, longitude = NULL, address = NULL)
  for ( i in 1:length(address) ){
    URL <- URLencode(paste("http://maps.google.com/maps/api/geocode/json?address=", address[i], sep=""))
    URL.data <- fromJSON(getURL(URL))
    latitude <- URL.data$results[[1]]$geometry$location$lat
    longitude <- URL.data$results[[1]]$geometry$location$lng
    formatted_address <- URL.data$results[[1]]$formatted_address
    address.data <- data.frame(latitude = latitude, longitude = longitude, address = formatted_address)
    addresses <- rbind(addresses, address.data)
  }
  return(addresses)
  
}
