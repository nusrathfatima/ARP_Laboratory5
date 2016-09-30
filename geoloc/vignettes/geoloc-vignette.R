## ---- eval = FALSE, include = FALSE--------------------------------------
#  library(devtools)
#  devtools::install_github("teno/ARP_Laboratory5", subdir="geoloc")
#  library(geoloc)

## ---- eval = FALSE-------------------------------------------------------
#  #  https://maps.googleapis.com/maps/api/geocode/json?parameters

## ----geo_connect_vector, eval=FALSE--------------------------------------
#  geo_connect_vector(c("Madrid", "Skattegarden 29B, Linkoping"))
#  geo_connect_vector(c("40.41678, -3.70379", "28.49634, -16.32415"))
#  geo_connect_vector(c("40.41678, -3.70379", "Skattegarden 29B, Linkoping"))

## ----geo_connect_csv, eval=FALSE-----------------------------------------
#  geo_connect_csv("my_csv_filepath")

