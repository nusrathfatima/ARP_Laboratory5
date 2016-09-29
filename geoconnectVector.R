
geo_connect_vector <- function(address){
  
  addresses <- data.frame(latitude = NULL, longitude = NULL, address = NULL)
  
  for ( i in 1:length(address) ){
    address.data <- geo_connect(address[i])
    addresses <- rbind(addresses, address.data)
  }
  return(addresses)
}