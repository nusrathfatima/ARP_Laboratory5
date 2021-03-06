% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geoconnect.R
\name{geo_connect}
\alias{geo_connect}
\title{Google Geocoding API connector}
\usage{
geo_connect(address)
}
\arguments{
\item{address}{A character vector with an address or some coordinates (latitude and longitude)}
}
\value{
A data.frame containing the resulting \code{longitude}, \code{latitude} and \code{address}
}
\description{
Passes the function parameter \code{address} as a parameter to the API via URL.
Then it returns the output of the request into a formatted dataframe with the geocoding information.
}
\references{
Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}
}

