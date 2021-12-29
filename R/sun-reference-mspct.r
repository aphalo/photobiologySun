#' Reference solar spectra from ASTM G173
#'
#' Dataset containing wavelengths and tabulated values for spectral irradiance
#' for the sun both above the terrestrial atmosphere and at ground level under
#' clear sky. The different spectra in this collection are from ASTM G173
#' standard.
#'
#' @note Please see the metadata in each spectrum. Metadata is stored in
#'   attributes and can accessed with functions
#'   \code{\link[photobiology]{getWhatMeasured}} and \code{\link{comment}}.
#'
#' @details \code{ASTM.E490.AM0} is the mean extraterrestrial solar spectrum,
#'   for air mass zero (AM0).
#'
#'   \code{Gueymard.AM0} is Gueymard's (2004) extraterrestrial solar spectrum,
#'   for air mass zero (AM0). Used as the basis for calculating the terrestrial
#'   solar spectra defined by ASTM G173.
#'
#'   \code{WMO.Wehrli.AM0} is Wehrli's (1985) extraterrestrial solar spectrum,
#'   for air mass zero (AM0). Used the World Meteorological Organization (WMO).
#'
#'   \code{ASTM.G173.global} is global spectral irradiance for air mass 1.5
#'   (AM1.5). Reference Spectrum Derived from SMARTS v. 2.9.2 for AM1.5. (solar
#'   zenith angle 48.19)
#'
#'   \code{ASTM.G173.direct} is direct spectral irradiance for air mass 1.5
#'   (AM1.5). Reference Spectrum Derived from SMARTS v. 2.9.2 for AM1.5. (solar
#'   zenith angle 48.19)
#'
#' @source \url{https://rredc.nrel.gov/solar/spectra/am1.5/}.
#'
#' @references ASTM (2012) ASTM G173 Standard Tables for Reference Solar
#' Spectral Irradiances: Direct Normal and Hemispherical on 37 degrees Tilted
#' Surface.
#' 
#' Gueymard, C. A. (2004) The sun's total and spectral irradiance for solar 
#' energy applications and solar radiation models. Solar Energy, 76, 423-453.
#' <doi:10.1016/j.solener.2003.08.039>
#' 
#' Wehrli, C. (1985) Extraterrestrial solar spectrum. Pub. No. 615, World 
#' Radiation Center, Davos, Switzerland.
#'
#' @docType data
#' @keywords datasets
#'
#' @format A \code{"source_mspct"} object containing 51 \code{"source_spct"}
#'   objects.
#'
#'   In each of the member spectra, the variables are as follows: \itemize{
#'   \item w.length (nm) \item s.e.irrad (W m-2 nm-1) }
#'
#' @examples
#'
#' names(sun_reference.mspct)
#' 
"sun_reference.mspct"

