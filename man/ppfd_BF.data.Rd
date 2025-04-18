% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/example.solar.irrad.data.r
\docType{data}
\name{ppfd_BF.data}
\alias{ppfd_BF.data}
\title{Ground level solar PAR photon irradiance, direct and diffuse (measured)}
\format{
A data frame with 24479 rows and 9 variables.
}
\usage{
ppfd_BF.data
}
\description{
Dataset containing mean, maximum, minimum and standard deviation values for
total, direct and difusse photosynthetically active radiation expresed as
photon irradiance. Values are summaries of 12 consecutive readings acquired
once every 5 s. The data set covers 17 consecutive days.
}
\details{
The variables are as follows: 
\itemize{ 
\item time_EEST POSIXct Local time according to EET coordinates. 
\item UTC POSIXct Local time according to UTC. 
\item ppfd_tot_mean numeric (umol m-2 m-2) 
\item ppfd_tot_min numeric (umol m-2 m-2) 
\item ppfd_tot_max numeric (umol m-2 m-2) 
\item ppfd_tot_sd numeric (umol m-2 m-2)
\item ppfd_diff_mean numeric (umol m-2 m-2) 
\item ppfd_diff_min numeric (umol m-2 m-2) 
\item ppfd_diff_max numeric (umol m-2 m-2) 
\item ppfd_diff_sd numeric (umol m-2 m-2)
}

These data are part of a much larger data set (Aphalo, 2023).
  Instrument used: Delta-T BF5 "quantum sensor" , mounted on tripod at
  approximately 2 m height. Data collected with a Campbell Scientific CR6
  datalogger, using analogue outputs from the sensor. Wavelength sensitivity
  range of the quantum sensor is 400 nm to 700 nm. Location: Viikki campus of
  the University of Helsinki, Finland.
}
\examples{
colnames(ppfd_BF.data)
nrow(ppfd_BF.data)
range(ppfd_BF.data$time_EET)
where_measured(ppfd_BF.data)
how_measured(ppfd_BF.data)
what_measured(ppfd_BF.data)
comment(ppfd_BF.data)
  
}
\references{
Aphalo, Pedro J. (2023) High frequency weather data for Viikki, Helsinki, 
Finland. \doi{10.17605/OSF.IO/E4VAU}.

\url{https://delta-t.co.uk/}
\url{https://www.campbellsci.com/}
}
\keyword{datasets}
