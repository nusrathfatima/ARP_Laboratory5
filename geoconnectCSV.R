
geo.connect.csv <- function(address.csv){
  
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
  geo.connect.vector(search.address)
}