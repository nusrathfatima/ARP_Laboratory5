# testing 

library(testthat)
library(geoloc)

URL <- URLencode(paste("http://maps.google.com/maps/api/geocode/json?address=", address, sep=""))
URL.data <- fromJSON(getURL(URL))
address <- "white house"
URL.data

# crear por separado vectores para address y coordenadas
lat <- c(40.41678, 58.41081)
lon <- c(-3.70379,  15.62137)
add <- c("Madrid, Spain", "Linkoping, Sweden")


x <- data.frame(latitude = 40.41678, 
                longitude = -3.70379,
                address = "Madrid, Spain")

y <- data.frame(latitude = 58.41081, 
                longitude = 15.62137,
                address = "Linköping, Sweden")

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

test_that("geo.connect", {
  expect_equal(as.data.frame(geo.connect("Madrid")), 
               data.frame(latitude = 40.41678, 
                          longitude = -3.70379,
                          address = "Madrid, Spain", 
                          stringsAsFactors = FALSE))
})


test_that("geo.connect.vector", {
  expect_equal(as.data.frame(geo.connect.vector(address)), 
               data.frame(latitude = 40.41678, 
                          longitude = -3.70379,
                          address = "Madrid, Spain", 
                          stringsAsFactors = FALSE))
})






### LAB 4 ###


# Input error for function QRlinreg
test_that("Input error for function QRlinreg: ", {
  expect_error(QRlinreg("a", iris), "class(formula) == \"formula\" is not TRUE", fixed = TRUE)
  expect_error(QRlinreg(faithful$eruptions ~ faithful$waiting, "str"), "is.data.frame(data) is not TRUE", fixed = TRUE)
})

# testing expected output of our methods:
# for each one we had to round the results 

# coef() method
test_that("coef() method", {
  expect_equal(obj.iris$coefficients, lm.iris$coefficients)
  expect_equal(obj.faithful$coefficients, lm.faithful$coefficients)
})

# resid() method
test_that("Residuos correct values", {
  expect_equal(obj.iris$residuals, lm.iris$residuals)
  expect_equal(obj.faithful$residuals, lm.faithful$residuals)
})

# pred() method
test_that("pred() method", {
  expect_equal(obj.iris$predicted, lm.iris$fitted.values)
  expect_equal(obj.faithful$predicted, lm.faithful$fitted.values)
})


#  testing linreg and attributes' class
test_that("testing classes", {
  expect_equal(class(obj.iris)[1],"linreg")
  expect_true(is.numeric(obj.iris$coefficients))
  expect_true(is.numeric(obj.iris$residuals))
  expect_true(is.numeric(obj.iris$predicted))
})