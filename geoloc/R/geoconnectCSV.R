#' Google Geocoding API connector for CSV files
#' @export
#' 
#' @description Takes a csv file path (with the required columns \code{Address} and/or \code{Latitude} and
#'  \code{Longitude}) as a parameter and creates a vector with the information that will be passed to the 
#' \code{geo_connect_vector} function that will connect with the Google Geocoding API and get the corresponding output.
#' 
#' @param csv_filepath A csv file path
#' 
#' @return A data.frame containing the resulting \code{longitude/s}, \code{latitude/s} and \code{address/es}
#' 
#' @references 
#' Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}
#' 
#' @examples
#' #geo_connect_csv(your_csv_filepath)
#'
#' 

geo_connect_csv <- function(csv_filepath){
  address.csv <- read.csv(csv_filepath, sep = ";")
  
  search.address <- NULL
  address.column <- any(tolower(names(address.csv)) == "address")
  lati.column <- any(tolower(names(address.csv)) == "latitude")
  long.column <- any(tolower(names(address.csv)) == "longitude")
  
  if (address.column){
    address.position <- which(tolower(names(address.csv)) == "address")
    search.address <- gsub("^\\s+|\\s+$", "", address.csv[, address.position])
    if (!all(search.address != "")){
      if ((lati.column) & (long.column)){
        lati.position <- which(tolower(names(address.csv)) == "latitude")
        long.position <- which(tolower(names(address.csv)) == "longitude")
        coord.position <- which(search.address == "")
        no.na <- which(complete.cases(address.csv[coord.position, c(lati.position, long.position)]))
        coord.position <- coord.position[no.na]
        search.address[coord.position] <- 
          paste(address.csv[, lati.position][coord.position], address.csv[, long.position][coord.position], sep = ", ")
      }
    }
  }else{
    if ((lati.column) & (long.column)){
      lati.position <- which(tolower(names(address.csv)) == "latitude")
      long.position <- which(tolower(names(address.csv)) == "longitude")
      coord.position <- which(complete.cases(address.csv[, c(lati.position, long.position)]))
      search.address[coord.position] <- 
        paste(address.csv[, lati.position][coord.position], address.csv[, long.position][coord.position], sep = ", ")
      coord.position.na <- which(!complete.cases(address.csv[, c(lati.position, long.position)]))
      search.address[coord.position.na] <- ""
    }
  }
  return(geo_connect_vector(search.address))
}