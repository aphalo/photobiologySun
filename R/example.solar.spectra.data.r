#' Ground level solar spectral irradiance (measured)
#' 
#' Datasets containing the wavelengths at a 0.5 nm to 1.0 nm interval and 
#' tabulated values of measrued spectral irradiance for the sun.
#' 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) }
#' 
#' @note Instrument used: Maya2000Pro scanning double monochromator
#' spectroradiometer with a Bentham cosine corrected input optics. Recently
#' calibrated at STUK. Date and time: . Place: University of Helsinki, Viikki
#' Campus, Finland. Measurements done by Pedro J. Aphalo. Calibration and
#' corrections done with package MayaCalc using bracketing and noise reduction
#' (with filter measurement) and method "sun". Algorithm and calibration data by
#' Lasse Ylianttila (STUK, Helsinki, Finland).
#' 
#' @references  Ylianttila, L.; Visuri, R.; Huurto, L. & Jokela, K. (2005) 
#'   Evaluation of a single-monochromator diode array spectroradiometer for 
#'   sunbed UV-radiation measurements. Photochem Photobiol, 81, 333-341
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 1425 rows (250 nm to 900 nm, variable step) and 3
#'   variables.
"sun_May_morning.spct"

#' Ground level spectral irradiance at hourly intervals
#' 
#' Datasets containing the wavelengths at 1.0 nm interval and tabulated values
#' spectral irradiance for the sun for late June in Helsinki.
#' 
#' @details 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) 
#' \item UTC POSIXct (UTC date and time)
#' \item EEST POSIXct (EEST date and time)
#' }
#' The data set includes NAs for missing night-time spectral irardiance 
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
#' Transfer Simulations. Photochemistry and Photobiology, 85: 1233–1239
#' 
#' @note A summary of these data has been published in the article by Morales
#'   et al. (2013). The simualtion methods has been described in Lindfors
#'   et al. (2009).
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 29464 rows  (293 nm to 800 nm at 1 nm interval) and
#'   3 variables.
"sun_hourly_june.spct"

#' Ground level spectral irradiance at hourly intervals
#' 
#' Datasets containing the wavelengths at 1.0 nm interval and tabulated values
#' spectral irradiance for the sun for late August in Helsinki..
#' 
#' @details 
#' The variables are as follows: 
#' \itemize{ 
#' \item w.length numeric (nm) 
#' \item s.e.irrad numeric (W m-2 nm-1) 
#' \item UTC POSIXct (UTC date and time)
#' \item EEST POSIXct (EEST date and time)
#' }
#' The data set includes NAs for missing night-time spectral irardiance 
#' values.
#' 
#' @author Anders K. Lindfors (radiation transfer modelling)
#'   
#' @references 
#' Lindfors, A.; Heikkilä, A.; Kaurola, J.; Koskela, T. & Lakkala, K. (2009) 
#' Reconstruction of Solar Spectral Surface UV Irradiances Using Radiative 
#' Transfer Simulations. Photochemistry and Photobiology, 85: 1233–1239
#' 
#' @note The simualtion methods has been described in Lindfors et al. (2009).
#'   
#' @docType data
#' @keywords datasets
#' @format A data frame with 15841 rows (290 nm to 800 nm at 1 nm interval) and 3
#'   variables.
"sun_hourly_august.spct"

#' @title Solar spectral irradiance in a tree canopy gap (measured)
#'
#' @description A dataset containing a sequence of 72 spectra measured with an 
#'   Ocean Optics Maya2000 Pro spectrometer and a Bentham DH-7-SM cosine 
#'   diffuser. Values measured on 30 April 2014, in the late morning, in 
#'   Helsinki, Finland, under clear sky conditions. The whole sequence was 
#'   measured in 39 seconds in a sunfleck under young silver birch trees. Place:
#'   University of Helsinki, Viikki Campus, Finland. Calibration and corrections
#'   done with package MayaCalc using bracketing and noise reduction (with
#'   filter measurement) and method "sun". Algorithm and calibration data by 
#'   Lasse Ylianttila (STUK, Helsinki, Finland).
#' 
#' @references  Ylianttila, L.; Visuri, R.; Huurto, L. & Jokela, K. (2005) 
#'   Evaluation of a single-monochromator diode array spectroradiometer for 
#'   sunbed UV-radiation measurements. Photochem Photobiol, 81, 333-341
#'   
#' @details \itemize{ \item w.length (nm), range 293 to 800 nm. \item s.e.irrad
#'   (W m-2 nm-1) \item s.q.irrad (mol m-2 nm-1) }
#'
#' @author T. Matthew Robson and Saara Hartikainen (data)
#'
#' @docType data
#' @keywords datasets
#' @format A \code{source_mspct} object containing a collection of 72
#'   source_spct objects.
#'   
"gap.mspct"

