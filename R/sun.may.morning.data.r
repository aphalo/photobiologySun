#' Spectral data for the sun
#'
#' Datasets containing the wavelengths at a 0.5 nm to 1.0 nm interval and
#' tabulated values spectral irradiance for the sun.
#' 
#' The variables are as follows:
#' \itemize{
#'   \item w.length (nm)  
#'   \item s.e.irrad (W m-2 nm-1)
#' }
#' 
#' @note
#' Instrument used: Maya2000Pro scanning double monochromator spectroradiometer with
#' a cosine corrected input optics. Recently calibrated at STUK.
#' Measurements done by Lasse Ylianttila (STUK, Helsinki, Finland).
#' Calibration and corrections done with package MayaCalc using bracketing and
#' noise reduction (with filter measurement) and method "sun".
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with 1425 rows (250 nm to 900 nm, variable step) and 3 variables.
#' @name sun_May_morning.data
#' @examples
#' library(photobiologySun)
#' library(photobiologyVIS)
#' with(sun_May_morning.data, photon_ratio(w.length, s.e.irrad, Blue(), Green()))
#' plot(s.e.irrad~w.length, data=sun_May_morning.data, main=comment(sun_May_morning.data), type="l")
#' @aliases 
#'   sun_May_morning.data 
NULL