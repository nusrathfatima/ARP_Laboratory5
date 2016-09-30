# testing 

library(testthat)
library(geoloc) 

# testing the inputs and outputs of our functions
expect_true(is.data.frame(geo_connect("Madrid")))
expect_true(is.data.frame(geo_connect_vector(c("Madrid", "Linkoping"))))
expect_true(is.data.frame(geo_connect_csv(system.file("extdata", "Addresses.csv", package = "geoloc"))))


# geo_connect()

test_that("testing function geo_connect",{
  # address 
  expect_equal(geo_connect("Madrid"), 
          data.frame(latitude = 40.41678, 
                            longitude = -3.70379,
                            address = "Madrid, Spain",
                            stringsAsFactors = FALSE),
                     tolerance = 0.00001)
  # coordenates
  expect_equal(geo_connect("40.41678, -3.70379"), 
           data.frame(latitude = 40.41671 , 
                      longitude = -3.703779,
                      address = "Plaza Puerta del Sol, 11, 28013 Madrid, Spain",
                      stringsAsFactors = FALSE),
           tolerance = 0.00001)
  # address ERROR         
  expect_equal(geo_connect("12.5asadsd"), 
           data.frame(latitude=0, 
                      longitude=0, 
                      address="ERROR", 
                      stringsAsFactors = FALSE))
})

# geo_connect_vector()
test_that("testing function geo_connect_vector",{
  # address vector
  expect_equal(geo_connect_vector(c("Madrid", "Av. de San Diego, San Cristóbal de La Laguna, Santa Cruz de Tenerife, Spain")), 
               data.frame(latitude = c(40.41678, 28.49634), 
                          longitude = c(-3.70379, -16.32415),
                          address = c("Madrid, Spain", 
                                      "Av. de San Diego, San Cristóbal de La Laguna, Santa Cruz de Tenerife, Spain"),
                          stringsAsFactors = FALSE),
               tolerance = 0.000001)
  # vector of address plus coordenates
  expect_equal(geo_connect_vector(c("Madrid", "28.49634, -16.32415")), 
               data.frame(latitude = c(40.41678, 28.49634), 
                          longitude = c(-3.70379, -16.32415),
                          address = c("Madrid, Spain", 
                                      "Av. de San Diego, 47, 38202 San Cristóbal de La Laguna, Santa Cruz de Tenerife, Spain"), 
                          stringsAsFactors = FALSE),
               tolerance = 0.000001)
  # coordenates vector
  expect_equal(geo_connect_vector(c("40.41678, -3.70379", "28.49634, -16.32415")), 
               data.frame(latitude = c(40.41678, 28.49634), 
                          longitude = c(-3.70379, -16.32415),
                          address = c("Plaza Puerta del Sol, 11, 28013 Madrid, Spain", 
                                      "Av. de San Diego, 47, 38202 San Cristóbal de La Laguna, Santa Cruz de Tenerife, Spain"), 
                          stringsAsFactors = FALSE),
               tolerance = 0.00001)
})
  
# geo_connect_csv()

# test_that("testing function geo_connect_csv",{
# 
#   expect_equal(geo_connect_csv(system.file("extdata", "Addresses.csv", package = "geoloc")), 
#                data.frame(latitude = c(48.85837, 38.89768, 41.89068, 40.64131, 0.00000, 0.00000),
#                           longitude = c(2.294481, -77.036530, 12.49134, -73.77814, 0.00000, 0.00000),
#                           address = c("Eiffel Tower, Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
#                                       "The White House, 1600 Pennsylvania Ave NW, Washington, DC 20500, USA",
#                                       "Piazza del Colosseo, 58, 00184 Roma, Italy",
#                                       "John F. Kennedy International Airport (JFK), Queens, NY 11430, USA",
#                                       "ERROR",
#                                       "ERROR"),
#                           stringsAsFactors = FALSE),
#                tolerance = 0.000001)
# })



