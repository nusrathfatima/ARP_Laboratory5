
geo.multiple <- function(address){
  
  addresses <- data.frame(latitude = NULL, longitude = NULL, address = NULL)
  
  for ( i in 1:length(address) ){
    address.data <- geo.connect(address[i])
    addresses <- rbind(addresses, address.data)
  }
  return(addresses)
}