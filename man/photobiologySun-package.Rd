% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/photobiologySun.R
\docType{package}
\name{photobiologySun-package}
\alias{photobiologySun}
\alias{photobiologySun-package}
\title{photobiologySun: Data for Sunlight Spectra}
\description{
\if{html}{\figure{logo.png}{options: style='float: right' alt='logo' width='120'}}

Data for the extraterrestrial solar spectral irradiance and ground level solar spectral irradiance and irradiance. In addition data for shade light under vegetation and irradiance time series from different broadband sensors. Part of the 'r4photobiology' suite, Aphalo P. J. (2015) \doi{10.19232/uv4pb.2015.1.14}.
}
\examples{
library(photobiology)
library(photobiologyWavebands)

q_irrad(sun_may_morning.spct, PAR())
q_ratio(sun_may_morning.spct, Red("Smith10"), Far_red("Smith10"))

}
\references{
Aphalo, P. J., Albert, A., Björn, L. O., McLeod, A. R., Robson,
T. M., Rosenqvist, E. (Eds.). (2012). Beyond the Visible: A handbook of best
practice in plant UV photobiology (1st ed., p. xxx + 174). Helsinki:
University of Helsinki, Department of Biosciences, Division of Plant Biology.
ISBN 978-952-10-8363-1 (PDF), 978-952-10-8362-4 (paperback). Open access PDF
download available at \url{https://hdl.handle.net/10138/37558}

Aphalo, Pedro J. (2015) The r4photobiology suite. UV4Plants Bulletin, 2015:1,
21-29. \doi{10.19232/uv4pb.2015.1.14}.
}
\seealso{
Useful links:
\itemize{
  \item \url{https://docs.r4photobiology.info/photobiologySun}
  \item \url{https://github.com/aphalo/photobiologySun}
  \item Report bugs at \url{https://github.com/aphalo/photobiologySun/issues}
}

}
\author{
\strong{Maintainer}: Pedro J. Aphalo \email{pedro.aphalo@helsinki.fi} (\href{https://orcid.org/0000-0003-3385-972X}{ORCID}) [translator]

Other contributors:
\itemize{
  \item T. Matthew Robson (\href{https://orcid.org/0000-0002-8631-796X}{ORCID}) [contributor]
  \item Saara M. Hartiakinen (\href{https://orcid.org/0000-0002-8430-6861}{ORCID}) [contributor]
  \item Anders Lindfors [contributor]
  \item Titta K. Kotilainen (\href{https://orcid.org/0000-0002-2822-9734}{ORCID}) [contributor]
}

}
