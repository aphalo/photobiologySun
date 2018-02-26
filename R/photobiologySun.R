#' @references
#' Aphalo, P. J., Albert, A., Björn, L. O., McLeod, A. R., Robson, T. M.,
#' Rosenqvist, E. (Eds.). (2012). Beyond the Visible: A handbook of best
#' practice in plant UV photobiology (1st ed., p. xxx + 174).
#' Helsinki: University of Helsinki, Department of Biosciences,
#' Division of Plant Biology. ISBN 978-952-10-8363-1 (PDF),
#' 978-952-10-8362-4 (paperback). Open access PDF download available at
#' \url{http://hdl.handle.net/10138/37558}
#' 
#' \url{https://www.nrel.gov/rredc/}
#' \url{http://www.astm.org/}
#'
#' @examples
#' library(photobiology)
#' library(photobiologyWavebands)
#' 
#' q_irrad(sun_may_morning.spct, PAR())
#' q_ratio(sun_may_morning.spct, Red("Smith10"), Far_red("Smith10"))
#'
#' @import photobiology
#'
"_PACKAGE"
