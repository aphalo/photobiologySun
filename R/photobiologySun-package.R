#' @title Spectral data for sun
#' 
#' @description This package provides data for the sun. The package is designed 
#' to complement package \code{photobiology}.
#' 
#' @docType package
#' @keywords misc
#' @name photobiologySun-package
#' @author Pedro J. Aphalo
#' @details
#' \tabular{ll}{
#' Package: \tab photobiologySun\cr
#' Type: \tab Package\cr
#' Version: \tab 0.3.4\cr
#' Date: \tab 2015-09-05\cr
#' License: \tab GPL (>= 3.0)\cr
#' URL: \tab \url{http://www.r4photobiology.info},\cr
#' \tab \url{https://bitbucket.org/aphalo/photobiologySun}\cr
#' BugReports: \tab \url{https://bitbucket.org/aphalo/photobiologySun}\cr
#' }
#' 
#' @references
#' Aphalo, P. J., Albert, A., Björn, L. O., McLeod, A. R., Robson, T. M., 
#' Rosenqvist, E. (Eds.). (2012). Beyond the Visible: A handbook of best 
#' practice in plant UV photobiology (1st ed., p. xxx + 174). 
#' Helsinki: University of Helsinki, Department of Biosciences, 
#' Division of Plant Biology. ISBN 978-952-10-8363-1 (PDF), 
#' 978-952-10-8362-4 (paperback). Open access PDF download available at 
#' \url{http://hdl.handle.net/10138/37558}
#' 
#' @examples
#' library(photobiologyWavebands)
#' q_irrad(sun_May_morning.spct, PAR())
#' q_ratio(sun_May_morning.spct, Red("Smith10"), Far_red("Smith10"))
#' 
#' @import photobiology
NULL
