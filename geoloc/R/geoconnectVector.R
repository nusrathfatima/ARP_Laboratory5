#' Google Geocoding API connector for character vectors
#' @export
#' 
#' @description Loops over the vector of addresses and/or coordinates, passes each one of them as a parameter 
#' to an internal function that connects to the \code{Google Geocoding API} via URL and gets the output. Then it 
#' returns the output of the request into a formatted dataframe with the geocoding information.
#' 
#' @param address A character vector with of address/es and/or some coordinates (latitude and longitude)
#' 
#' @return A data.frame containing the resulting \code{longitude/s}, \code{latitude/s} and \code{address/es}
#' 
#' @references 
#' Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}
#' 
#' @examples
#' geo_connect_vector(c("Madrid", "Skattegarden 29B, Linkoping"))
#' geo_connect_vector(c("40.41678, -3.70379", "28.49634, -16.32415"))
#' geo_connect_vector(c("40.41678, -3.70379", "Skattegarden 29B, Linkoping"))
#' 

geo_connect_vector <- function(address){
  
  addresses <- data.frame(latitude = NULL, longitude = NULL, address = NULL)
  
  for ( i in 1:length(address) ){
    address.data <- geo_connect(address[i])
    addresses <- rbind(addresses, address.data)
  }
  return(addresses)
}