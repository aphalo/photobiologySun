#' Ground level solar irradiance (measured)
#' 
#' Dataset containing mean, maximum, minimum and standard deviation values for 
#' global radiation data expresed as (energy) irradiance. Each value is a summary
#' 60 consecutive readings acquired once every second. 
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item e_irrad_mean numeric (W m-2) 
#' \item e_irrad_min numeric (W m-2) 
#' \item e_irrad_max numeric (W m-2) 
#' \item e_irrad_sd numeric (W m-2)
#' }
#' 
#' @note Instrument used: Kipp SMP3 smart pyranometer, factory calibrated, mounted 
#' on tripod at approximately 2 m height. Data collected with a Campbell
#' Scientific CR6 datalogger. Wavelength sensitivity range of the pyranometer
#' is 300 nm to 2800 nm. Location: Viikki campus of the University of Helsinki.
#' Coordinates: 60.226803 N, 25.019205 E.
#' 
#' @references  
#' \url{http://www.kippzonen.com/}
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 5 variables.
#'   variables.
"irrad_Kipp.data"

#' Ground level solar PAR photon irradiance (measured)
#' 
#' Dataset containing mean, maximum, minimum and standard deviation values for 
#' photosynthetically active radiaition expresed as photon irradiance. Each value is a summary
#' 60 consecutive readings acquired once every second. 
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item ppfd_mean numeric (mol m-2 m-2) 
#' \item ppfd_min numeric (mol m-2 m-2) 
#' \item ppfd_max numeric (mol m-2 m-2) 
#' \item ppfd_sd numeric (mol m-2 m-2)
#' }
#' 
#' @note Instrument used: LI-COR LI-190 quantum sensor,  mounted 
#' on tripod at approximately 2 m height. Data collected with a Campbell
#' Scientific CR6 datalogger. Sensor connected through a LI-COR millivolt adaptor
#' (604 ohm). Wavelength sensitivity range of the quantum sensor
#' is 400 nm to 700 nm. Location: Viikki campus of the University of Helsinki.
#' Coordinates: 60.226803 N, 25.019205 E.
#' 
#' @references  
#' \url{http://www.licor.com/}
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 5 variables.
#'
"ppfd_LICOR.data"

#' Ground level solar PAR photon irradiance, direct and diffuse (measured)
#' 
#' Dataset containing mean, maximum, minimum and standard deviation values for 
#' total, direct and difusse 
#' photosynthetically active radiation expresed as photon irradiance. Each value is a summary
#' 60 consecutive readings acquired once every second. 
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item ppfd_tot_mean numeric (mol m-2 m-2) 
#' \item ppfd_tot_min numeric (mol m-2 m-2) 
#' \item ppfd_tot_max numeric (mol m-2 m-2) 
#' \item ppfd_tot_sd numeric (mol m-2 m-2)
#' \item ppfd_diff_mean numeric (mol m-2 m-2) 
#' \item ppfd_diff_min numeric (mol m-2 m-2) 
#' \item ppfd_diff_max numeric (mol m-2 m-2) 
#' \item ppfd_diff_sd numeric (mol m-2 m-2)
#' }
#' 
#' @note Instrument used: Delta-T BF5 "quantum sensor" , mounted 
#' on tripod at approximately 2 m height. Data collected with a Campbell
#' Scientific CR6 datalogger, using analogue outputs from the sensor. 
#' Wavelength sensitivity range of the quantum sensor
#' is 400 nm to 700 nm. Location: Viikki campus of the University of Helsinki.
#' Coordinates: 60.226803 N, 25.019205 E.
#' 
#' @references  
#' \url{http://www.delta-t.co.uk/}
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 9 variables.
#'   variables.
"ppfd_BF.data"

