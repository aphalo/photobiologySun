#' Spectral data for the extraterrestrial solar spectrum ASTM E490
#'
#' Air Mass zero (AM0) spectrum
#' Dataset containing wavelengths from 119.5 nm to 1E6 nm and 
#' tabulated values for spectral irradiance for the sun above the
#' terrestrial atmosphere ("mean" value).
#' 
#' The variables are as follows:
#' \itemize{
#'   \item w.length (nm)  
#'   \item s.e.irrad (W m-2 nm-1)
#'   \item s.q.irrad (mol s-1 m-2 nm-1)
#' }
#' 
#' @note
#' ASTM E490 (2000) AM0 standard (2004)
#' Extraterrestrial solar spectrum
#' Air mass zero (AM0)
#' \url{http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html}.
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with  rows (119.5 nm to 1E6 nm, variable step) and 3 variables.
"ASTM_E490_AM0.spct"

#' Spectral data for the extraterrestrial solar spectrum of Gueymard (2004)
#'
#' Air Mass zero (AM0) spectrum
#' Dataset containing wavelengths from 280.0 nm to 4000 nm and 
#' tabulated values for spectral irradiance for the sun above the
#' terrestrial atmosphere ("mean" value). This spectrum was used
#' as the basis for calculating the terrestrial solar spectrum
#' defines by ASTM G173
#' 
#' The variables are as follows:
#' \itemize{
#'   \item w.length (nm)  
#'   \item s.e.irrad (W m-2 nm-1)
#'   \item s.q.irrad (mol s-1 m-2 nm-1)
#' }
#' 
#' @note
#' These data accompany the ASTM G173 spectral data.
#' Extraterrestrial solar spectrum
#' Air mass zero (AM0)
#' \url{http://rredc.nrel.gov/solar/spectra/am1.5/}.
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with  rows (119.5 nm to 1E6 nm, variable step) and 3 variables.
"Gueymard_AM0.spct"

#' Spectral data for the extraterrestrial solar spectrum of Wehrli
#'
#' Air Mass zero (AM0) spectrum
#' Dataset containing wavelengths from 199.5 nm to 10075 nm and 
#' tabulated values for spectral irradiance for the sun above the
#' terrestrial atmosphere ("mean" value).
#' 
#' The variables are as follows:
#' \itemize{
#'   \item w.length (nm)  
#'   \item s.e.irrad (W m-2 nm-1)
#'   \item s.q.irrad (mol s-1 m-2 nm-1)
#' }
#' 
#' @note
#' Wehrli's (1985) AM0
#' extraterrestrial solar spectrum
#' Air Mass zero (AM0)
#' \url{http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html}.
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with  rows (119.5 nm to 1E6 nm, variable step) and 3 variables.
"WMO_Wehrli_AM0.spct"

#' Spectral data for the terrestrial solar spectrum ASTM G173
#'
#' Air Mass 1.5 (AM1.5) spectrum
#' Dataset containing wavelengths from 280.0 nm to 4000.0 nm and 
#' tabulated values for spectral irradiance for the sun "typical for USA".
#' Dataframe ASTM_G173_global.spct contains the spectrum of global solar
#' radiation on a plane at an inclination of 37 degrees, which together
#' with the assumed solar elevation results on a surface pointing at the
#' sun.
#' 
#' The variables are as follows:
#' \itemize{
#'   \item w.length (nm)  
#'   \item s.e.irrad (W m-2 nm-1)
#'   \item s.q.irrad (mol s-1 m-2 nm-1)
#' }
#' 
#' @note
#' ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5
#' Terrestrial solar spectrum
#' Air mass 1.5 (AM1.5)
#' (solar zenith angle 48.19 s)
#' from \url{http://rredc.nrel.gov/solar/spectra/am1.5/}
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with  rows (119.5 nm to 1E6 nm, variable step) and 3 variables.
"ASTM_G173_global.spct"

#' Spectral data for the terrestrial solar spectrum ASTM G173
#'
#' Air Mass 1.5 (AM1.5) spectrum
#' Dataset containing wavelengths from 280.0 nm to 4000.0 nm and 
#' tabulated values for spectral irradiance for the sun "typical for USA".
#' Dataframe ASTM_G173_direct.spct contains the spectrum of direct solar
#' radiation on a plane at an inclination of 37 degrees, which together
#' with the assumed solar elevation results on a surface pointing at the
#' sun.
#' 
#' The variables are as follows:
#' \itemize{
#'   \item w.length (nm)  
#'   \item s.e.irrad (W m-2 nm-1)
#'   \item s.q.irrad (mol s-1 m-2 nm-1)
#' }
#' 
#' @note
#' ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5
#' Terrestrial solar spectrum
#' Air mass 1.5 (AM1.5)
#' (solar zenith angle 48.19 s)
#' from \url{http://rredc.nrel.gov/solar/spectra/am1.5/}
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with  rows (119.5 nm to 1E6 nm, variable step) and 3 variables.
"ASTM_G173_direct.spct"
