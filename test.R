# testing 

library(testthat)
#library(geoloc) ???!!!


# creating some examples for testing
ad <- c("Madrid", "Rydsvagen 254, Linkoping")
coo.mad <- c(40.41678, -3.70379)
coo.lin <- c(58.41236, 15.56107 )
add <- c("Madrid, Spain", "Rydsvägen 254, 584 31 Linköping, Sweden")

# testing the limits of the API configuration  ???!!!
# URL.data$status == "OK"

# testing the inputs and outputs of our functions
# como controlo address del geo.connect  ??!!
expect_true(is.data.frame(class(geo.connect("Madrid"))))
expect_true(is.data.frame(class(geo.connect.vector(c("Madrid", "Linkoping")))))
expect_true(is.data.frame(class(geo.connect.csv(""))))

# pruebas:
# 1) address
# 2) coordenada (ll)
# 3) vector address
# 4) vector coordenada (ll)
# 5) vector (address, coordenada)

# crear un csv "pequeño" (varios fallos)
# 1) address
# 2) coordenada (ll) 
# 3) vector (address, coordenada)

# geo.connect()

expect_that(geo.connect("Madrid"), 
            equals(data.frame(latitude = 40.41678, 
                              longitude = -3.70379,
                              address = "Madrid, Spain",
                              stringsAsFactors = FALSE),
                   tolerance = 0.00001))

expect_equal(geo.connect("40.41678, -3.70379"), 
             data.frame(latitude = 40.41671 , 
                        longitude = -3.703779,
                        address = "Plaza Puerta del Sol, 11, 28013 Madrid, Spain",
                        stringsAsFactors = FALSE),
             tolerance = 0.00001)
            
expect_equal(geo.connect("12.5asa"), 
             data.frame(latitude=0, 
                        longitude=0, 
                        address="ERROR", 
                        stringsAsFactors = FALSE))


# geo.connect.vector()

expect_equal(geo.connect.vector(c("Madrid", "Rydsvagen 254, Linkoping")), 
             data.frame(latitude = c(40.41678, 58.41236), 
                        longitude = c(-3.70379, 15.56107),
                        address = c("Madrid, Spain", 
                                    "Rydsvägen 254, 584 31 Linköping, Sweden"),
                        stringsAsFactors = FALSE),
             tolerance = 0.000001)

expect_equal(geo.connect.vector(c("Madrid", "58.41236, 15.56107")), 
             data.frame(latitude = c(40.41678, 58.41236), 
                        longitude = c(-3.70379, 15.56107),
                        address = c("Madrid, Spain", 
                                    "Rydsvägen 254, 584 31 Linköping, Sweden"), 
                        stringsAsFactors = FALSE),
             tolerance = 0.000001)

expect_equal(geo.connect.vector(c("40.41678, -3.70379", "58.41236, 15.56107")), 
             data.frame(latitude = c(40.41678, 58.41236), 
                        longitude = c(-3.70379, 15.56107),
                        address = c("Plaza Puerta del Sol, 11, 28013 Madrid, Spain", 
                                    "Rydsvägen 254, 584 31 Linköping, Sweden"), 
                        stringsAsFactors = FALSE),
             tolerance = 0.00001)

# geo.connect.csv()

csv <- read.csv("D:/Advanced Programming in R/Lab5/address.txt", sep = ";")
csv
expect_equal(geo.connect.csv(csv), 
             data.frame(latitude = c(48.85837, 38.89768),
                        longitude = c(2.294481, -77.036530),
                        address = c("Eiffel Tower, Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
                                    "The White House, 1600 Pennsylvania Ave NW, Washington, DC 20500, USA"),
                        stringsAsFactors = FALSE),
             tolerance = 0.00001)




