#' Ground level solar irradiance (measured)
#' 
#' Dataset containing mean, maximum, minimum and standard deviation values for 
#' global radiation data expressed as (energy) irradiance. Values are summaries
#' of 12 consecutive readings acquired once every 5 s. The data set covers 17
#' consecutive days.
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item UTC POSIXct Local time according to UTC. 
#' \item e_irrad_mean numeric (W m-2) 
#' \item e_irrad_min numeric (W m-2) 
#' \item e_irrad_max numeric (W m-2) 
#' \item e_irrad_sd numeric (W m-2)
#' }
#' 
#' @details These data are part of a much larger data set (Aphalo, 2023).
#  Instrument used: Kipp SMP3 smart pyranometer, factory calibrated, mounted 
#' on tripod at approximately 2 m height. Data collected with a Campbell
#' Scientific CR6 datalogger. Wavelength sensitivity range of the pyranometer
#' is 300 nm to 2800 nm. Location: Viikki campus of the University of Helsinki.
#' 
#' @references  
#' Aphalo, Pedro J. (2023) High frequency weather data for Viikki, Helsinki, 
#' Finland. \doi{10.17605/OSF.IO/E4VAU}.
#' 
#' \url{https://www.kippzonen.com/}
#' 
#' @examples
#' colnames(irrad_Kipp.data)
#' nrow(irrad_Kipp.data)
#' range(irrad_Kipp.data$time_EET)
#' where_measured(irrad_Kipp.data)
#' how_measured(irrad_Kipp.data)
#' what_measured(irrad_Kipp.data)
#' comment(irrad_Kipp.data)
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 5 variables.
#'   variables.
"irrad_Kipp.data"

#' Ground level solar PAR photon irradiance (measured)
#' 
#' Dataset containing mean, maximum, minimum and standard deviation values for
#' photosynthetically active radiaition expresed as photon irradiance. Values
#' are summaries of 12 consecutive readings acquired once every 5 s. The data
#' set covers 17 consecutive days.
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item UTC POSIXct Local time according to UTC. 
#' \item ppfd_mean numeric (umol m-2 m-2) 
#' \item ppfd_min numeric (umol m-2 m-2) 
#' \item ppfd_max numeric (umol m-2 m-2) 
#' \item ppfd_sd numeric (umol m-2 m-2)
#' }
#' 
#' @details These data are part of a much larger data set (Aphalo, 2023).
#  Instrument used: LI-COR LI-190 quantum sensor,  mounted 
#' on tripod at approximately 2 m height. Data collected with a Campbell
#' Scientific CR6 datalogger. Sensor connected through a LI-COR millivolt adaptor
#' (604 ohm). Wavelength sensitivity range of the quantum sensor
#' is 400 nm to 700 nm. Location: Viikki campus of the University of Helsinki.
#' 
#' @references  
#' Aphalo, Pedro J. (2023) High frequency weather data for Viikki, Helsinki, 
#' Finland. \doi{10.17605/OSF.IO/E4VAU}.
#' 
#' \url{https://www.licor.com/env/}
#' \url{https://www.campbellsci.com/}
#' 
#' @examples
#' colnames(ppfd_LICOR.data)
#' nrow(ppfd_LICOR.data)
#' range(ppfd_LICOR.data$time_EET)
#' where_measured(ppfd_LICOR.data)
#' how_measured(ppfd_LICOR.data)
#' what_measured(ppfd_LICOR.data)
#' comment(ppfd_LICOR.data)
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 5 variables.
#'
"ppfd_LICOR.data"

#' Ground level solar PAR photon irradiance, direct and diffuse (measured)
#' 
#' Dataset containing mean, maximum, minimum and standard deviation values for
#' total, direct and difusse photosynthetically active radiation expresed as
#' photon irradiance. Values are summaries of 12 consecutive readings acquired
#' once every 5 s. The data set covers 17 consecutive days.
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item UTC POSIXct Local time according to UTC. 
#' \item ppfd_tot_mean numeric (umol m-2 m-2) 
#' \item ppfd_tot_min numeric (umol m-2 m-2) 
#' \item ppfd_tot_max numeric (umol m-2 m-2) 
#' \item ppfd_tot_sd numeric (umol m-2 m-2)
#' \item ppfd_diff_mean numeric (umol m-2 m-2) 
#' \item ppfd_diff_min numeric (umol m-2 m-2) 
#' \item ppfd_diff_max numeric (umol m-2 m-2) 
#' \item ppfd_diff_sd numeric (umol m-2 m-2)
#' }
#' 
#' @details These data are part of a much larger data set (Aphalo, 2023).
#'   Instrument used: Delta-T BF5 "quantum sensor" , mounted on tripod at
#'   approximately 2 m height. Data collected with a Campbell Scientific CR6
#'   datalogger, using analogue outputs from the sensor. Wavelength sensitivity
#'   range of the quantum sensor is 400 nm to 700 nm. Location: Viikki campus of
#'   the University of Helsinki, Finland.
#' 
#' @references  
#' Aphalo, Pedro J. (2023) High frequency weather data for Viikki, Helsinki, 
#' Finland. \doi{10.17605/OSF.IO/E4VAU}.
#' 
#' \url{https://delta-t.co.uk/}
#' \url{https://www.campbellsci.com/}
#' 
#' @examples
#' colnames(ppfd_BF.data)
#' nrow(ppfd_BF.data)
#' range(ppfd_BF.data$time_EET)
#' where_measured(ppfd_BF.data)
#' how_measured(ppfd_BF.data)
#' what_measured(ppfd_BF.data)
#' comment(ppfd_BF.data)
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 9 variables.
#' 
"ppfd_BF.data"

#' Ground level irradiance for wavelength bands
#' 
#' Dataset containing mean values for observed terrestrial radiation for PAR,
#' UV-B, UV-A2, UV-A1, blue, red, and far-red photon irradiances and global
#' radiation energy irradiance. Values are summaries of 12 consecutive readings
#' acquired once every 5 s. The data set covers 4 consecutive days with
#' different cloud conditions.
#' 
#' @details
#' The variables are as follows: 
#' \itemize{ 
#' \item time_EEST POSIXct Local time according to EET coordinates. 
#' \item UTC POSIXct Local time according to UTC. 
#' \item solar_time numeric Local solar time (h)
#' \item sun_elevation numeric Sun elevation above the astronomical horizon (degrees)
#' \item PAR_umo numeric (umol m-2 m-2) 
#' \item PAR_diff_fr numeric Fraction of total downwelling PAR that is diffuse (/1) 
#' \item global_watt numeric Global radiation (W m-2) 
#' \item red_umol numeric Red () light (umol m-2 m-2)
#' \item far_red_umol numeric Far red () light (umol m-2 m-2)
#' \item blue_umol numeric blue light () (umol m-2 m-2) 
#' \item blue_sellaro_umol numeric blue light () (umol m-2 m-2) 
#' \item UVA_umol numeric UV-A radiation (315-400 nm) (umol m-2 m-2) 
#' \item UVA1_umol numeric UV-A1 radiation (340-400 nm) (umol m-2 m-2) 
#' \item UVA2_umol numeric UV-A2 radiation (315-340 nm) (umol m-2 m-2) 
#' \item UVB_umol numeric UV-B radiation (280-315 nm) (umol m-2 m-2) 
#' \item solar_disk factor Estimate of whether the solar disk was visible or occluded (visible, occluded)
#' }
#' 
#' @details These data are part of a much larger data set (Aphalo, 2023).
#    All broad-band sensors, mounted on tripod at approximately 2.5 m
#'   height. Data collected with a Campbell Scientific CR6 datalogger, using
#'   analogue outputs from the sensors. Location: Viikki campus of the
#'   University of Helsinki. Coordinates: 60.226803 N, 25.019205 E. Same data
#'   were plotted in Fig. 1 of Sellaro et al. (2024).
#' 
#' @references
#' Aphalo, Pedro J. (2023) High frequency weather data for Viikki, Helsinki, 
#' Finland. \doi{10.17605/OSF.IO/E4VAU}.
#' 
#' Sellaro, Romina; Durand, Maaxime; Aphalo, Pedro J., Casal, Jorge J. (2024)
#' Making the most of canopy light: shade avoidance under a fluctuating spectrum
#' and irradiance. Journal of Experimental Botany, erae334. 
#' \doi{10.1093/jxb/erae334}.
#' 
#' @examples
#' colnames(four_days_1min.data)
#' nrow(four_days_1min.data)
#' range(four_days_1min.data$time_EET)
#' where_measured(four_days_1min.data)
#' how_measured(four_days_1min.data)
#' what_measured(four_days_1min.data)
#' comment(four_days_1min.data)
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with 24479 rows and 9 variables.
#'   variables.
"four_days_1min.data"

