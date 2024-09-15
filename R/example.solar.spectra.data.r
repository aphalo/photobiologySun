#' Ground level solar spectral irradiance (measured)
#' 
#' Datasets containing the wavelengths at a 0.5 nm to 1.0 nm interval and 
#' tabulated values of measured spectral irradiance for the sun.
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) }
#' 
#' @note Instrument used: Maya2000Pro scanning double monochromator 
#'   spectroradiometer with a Bentham cosine corrected input optics. Recently 
#'   calibrated at STUK. Date and time: 31 May 2013, 11:23 EEST. Place:
#'   University of Helsinki, Viikki Campus, Finland. Coordinates: 60.226183 N,
#'   25.018302 E. Measurements done by Pedro J. Aphalo. Calibration and
#'   corrections done with package MayaCalc using bracketing and noise reduction
#'   (with filter measurement) and method "sun". Algorithm and calibration data
#'   by Lasse Ylianttila (STUK, Helsinki, Finland).
#'   
#' @references  Ylianttila, L.; Visuri, R.; Huurto, L. & Jokela, K. (2005) 
#'   Evaluation of a single-monochromator diode array spectroradiometer for 
#'   sunbed UV-radiation measurements. Photochem Photobiol, 81, 333-341
#'   
#' @docType data
#' @keywords datasets
#' @format A \code{source_spct} object with 1421 rows (250 nm to 899 nm,
#'   variable step) and 2 variables.
#'   
#' @examples
#' sun_may_morning.spct
#' wl_range(sun_may_morning.spct)
#' e_irrad(sun_may_morning.spct)
#' 
"sun_may_morning.spct"

#' Ground level spectral irradiance at hourly intervals
#' 
#' Datasets containing the wavelengths at 1.0 nm interval and tabulated values
#' of spectral irradiance for the sun for 22 to 24 June 2010 in Helsinki,
#' Finland.
#' 
#' @details 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) 
#' \item UTC POSIXct (UTC date and time)
#' \item spct.idx factor with one level per spectrum
#' }
#' The data set includes NAs for missing night-time spectral irradiance 
#' values.
#' 
#' @author Anders K. Lindfors (radiation transfer modelling)
#'   
#' @references Morales, L. O.; Brosché, M.; Vainonen, J.; Jenkins, G. I.;
#' Wargent, J. J.; Sipari, N.; Strid, A.; Lindfors, A. V.; Tegelberg, R. &
#' Aphalo, P. J. (2013) Multiple roles for UV RESISTANCE LOCUS8 in regulating
#' gene expression and metabolite accumulation in Arabidopsis under solar
#' ultraviolet radiation. Plant Physiology, 161, 744-759
#' 
#' Lindfors, A.; Heikkilä, A.; Kaurola, J.; Koskela, T. & Lakkala, K. (2009) 
#' Reconstruction of Solar Spectral Surface UV Irradiances Using Radiative 
#' Transfer Simulations. Photochemistry and Photobiology, 85: 1233-1239
#' 
#' @note A summary of these data has been published in the article by Morales
#'   et al. (2013). The simulation methods has been described in Lindfors
#'   et al. (2009).
#'   
#' @docType data
#' @keywords datasets
#' @format A \code{source_spct} containing 58 spectra in long form (293 nm to
#'   800 nm at 1 nm interval) and 4 variables \code{w.length}, \code{s.e.irrad},
#'   \code{UTC}, and \code{spct.idx}.
#'   
#' @examples
#' e_irrad(sun_hourly_june.spct)
#' wl_range(sun_hourly_june.spct)
#' getMultipleWl(sun_hourly_june.spct) # number of spectra
#' 
"sun_hourly_june.spct"

#' Ground level spectral irradiance at hourly intervals
#' 
#' Datasets containing the wavelengths at 1.0 nm interval and tabulated values
#' of spectral irradiance for the sun for 21 and 22 August in Helsinki, Finland.
#' 
#' @details 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) 
#' \item UTC POSIXct (UTC date and time)
#' \item spct.idx factor with one level per spectrum
#' }
#' The data set includes NAs for missing night-time spectral irradiance 
#' values.
#' 
#' @author Anders K. Lindfors (radiation transfer modelling)
#'   
#' @references 
#' Lindfors, A.; Heikkilä, A.; Kaurola, J.; Koskela, T. & Lakkala, K. (2009) 
#' Reconstruction of Solar Spectral Surface UV Irradiances Using Radiative 
#' Transfer Simulations. Photochemistry and Photobiology, 85: 1233-1239
#' 
#' @note The simualtion methods has been described in Lindfors et al. (2009).
#'   
#' @docType data
#' @keywords datasets
#' @format A \code{source_spct} containing 31 spectra in long form (293 nm to
#'   800 nm at 1 nm interval) and 4 variables \code{w.length}, \code{s.e.irrad},
#'   \code{UTC}, and \code{spct.idx}.
#'   
#' @examples
#' e_irrad(sun_hourly_august.spct)
#' wl_range(sun_hourly_august.spct)
#' getMultipleWl(sun_hourly_august.spct) # number of spectra
#' 
"sun_hourly_august.spct"

#' Ground level spectral irradiance at hourly intervals
#' 
#' Datasets containing the wavelengths at 1.0 nm interval and tabulated values
#' of spectral irradiance for the sun for 21 May, at Jokioinen, Finland, under
#' climatology-based mean ozone column and with a 20% depletion. Simulated with
#' 'libradtran' assuming clear sky.
#' 
#' @details 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm).
#' \item s.e.irrad numeric (W m-2 nm-1).
#' \item UTC POSIXct (UTC date and time).
#' \item ozone Factor with two levels.
#' \item sun.elevation Angle above the astronomical horizon (degrees).
#' \item spct.idx factor with one level per spectrum.
#' }
#' The data set includes spectra for day-time, not 24 h.
#' 
#' @author Anders K. Lindfors (radiation transfer modelling)
#'   
#' @references 
#' Lindfors, A.; Heikkilä, A.; Kaurola, J.; Koskela, T. & Lakkala, K. (2009) 
#' Reconstruction of Solar Spectral Surface UV Irradiances Using Radiative 
#' Transfer Simulations. Photochemistry and Photobiology, 85: 1233-1239
#' 
#' @note The simualtion methods has been described in Lindfors et al. (2009).
#'   
#' @docType data
#' @keywords datasets
#' @format A \code{source_spct} containing 32 spectra in long form (293 nm to
#'   800 nm at 1 nm interval) and 6 variables.
#'   
#' @examples
#' e_irrad(sun_hourly_ozone.spct)
#' wl_range(sun_hourly_ozone.spct)
#' getMultipleWl(sun_hourly_ozone.spct) # number of spectra
#' 
"sun_hourly_ozone.spct"

#' @title Solar spectral irradiance in a tree canopy gap (measured)
#'
#' @description A dataset containing a sequence of 72 spectra measured with an 
#'   Ocean Optics Maya2000 Pro spectrometer and a Bentham DH-7-SM cosine 
#'   diffuser. Values measured on 30 April 2014, in the late morning, under
#'   clear sky conditions. The whole sequence was measured in 39 seconds in a
#'   sunfleck under young silver birch trees. Place: University of Helsinki,
#'   Viikki Campus, Finland. Coordinates: 60.227162 N, 25.019429 E. Calibration
#'   and corrections done with package MayaCalc using bracketing and noise
#'   reduction (with filter measurement) and method "sun". Algorithm and
#'   calibration data by Lasse Ylianttila (STUK, Helsinki, Finland).
#' 
#' @references  Ylianttila, L.; Visuri, R.; Huurto, L. & Jokela, K. (2005) 
#'   Evaluation of a single-monochromator diode array spectroradiometer for 
#'   sunbed UV-radiation measurements. Photochem Photobiol, 81, 333-341
#'   
#' @details \itemize{ \item w.length (nm), range 293 to 800 nm. \item s.e.irrad
#'   (W m-2 nm-1) }
#'
#' @author T. Matthew Robson and Saara Hartikainen (data).
#'
#' @docType data
#' @keywords datasets
#' @format A \code{source_mspct} object containing a collection of 72
#'   \code{source_spct} objects.
#'   
#' @examples
#' length(gap.mspct)
#' summary(gap.mspct)
#' e_irrad(gap.mspct, attr2tb = "when.measured")
#'   
"gap.mspct"

#' Ground level spectral irradiance and sun elevation
#' 
#' Datasets containing the wavelengths at 1.0 nm interval and tabulated values
#' of spectral irradiance and its direct and diffuse components at different 
#' sun elevation angles under clear sky conditions.
#' 
#' @details 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) 
#' \item s.e.irrad.dir numeric (W m-2 nm-1)
#' \item s.e.irrad.diff.down numeric (W m-2 nm-1)
#' \item s.e.irrad.diff.up numeric (W m-2 nm-1)
#' \item sun.elevation factor with one level per spectrum
#' }
#' 
#' @author Pedro J. Aphalo (radiation transfer modelling with Quick TUV 
#' calculator, TUV 5.3)
#'   
#' @references
#' 
#' Quick TUV calculator 
#' \url{https://www.acom.ucar.edu/Models/TUV/Interactive_TUV/}.
#'   
#' @docType data
#' @keywords datasets
#' @format A \code{source_spct} containing 34 spectra in long form (290.5 nm to
#'   699.5 nm at 1 nm interval) and 6 variables.
#'   
#' @examples
#' e_irrad(sun_elevation.spct)
#' wl_range(sun_elevation.spct)
#' getMultipleWl(sun_elevation.spct) # number of spectra
#' 
"sun_elevation.spct"

