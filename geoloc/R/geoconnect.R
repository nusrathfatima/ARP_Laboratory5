#' Google Geocoding API connector
#' 
#' @description Passes the function parameter \code{address} as a parameter to the API via URL.
#' Then it returns the output of the request into a formatted dataframe with the geocoding information.
#' 
#' 
#' @param address A character vector with an address or some coordinates (latitude and longitude)
#' 
#' @return A data.frame containing the resulting \code{longitude}, \code{latitude} and \code{address}
#' 
#' @references 
#' Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}

geo_connect <- function(address){
  
  library(RCurl)
  library(rjson)
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
  address.data <- data.frame(latitude = latitude, longitude = longitude, address = formatted_address, stringsAsFactors = FALSE)
  
  return(address.data)
}