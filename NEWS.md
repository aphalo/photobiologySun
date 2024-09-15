## photobiologySun 0.5.1

* Add data for terrestrial solar spectra for 20% ozone depletion under clear sky.
* Spectra from TUV simulations under clear sky conditions for different sun elevation angles.
* [pending] Add data for irradiances of UV-B, UV-A2, UV-A1, Blue radiation measured at a frequency of 0.5 s.

## photobiologySun 0.5.0

This update may break some existing code because of changes to naming of factor
levels and addition of attributes.

* Fix scaling error (10<sup>6</sup>) in _ASTM E490 AM0_ spectrum included in 
  `sun_reference.mspct`.
* Rebuild data objects with 'photobiology' 0.11.2 adding metadata and 
  `spct.idx` when previsously missing.
* Add some examples to documentation.

## photobiologySun 0.4.1

* Rebuild data objects with 'photobiology' 0.9.26 to fix minor bugs.
* Replace non-ASCII characters in documentation.

## photobiologySun 0.4.0

* Group reference spectra into a collection.
* Rebuild all data objects adding metadata.
* New vignette.
* First CRAN version.

## photobiologySun 0.3.7

* Convert vignette to R markdown. 
* Use 'pkgdown'.

## photobiologySun 0.3.6

*  Update for 'photobiology' 0.9.1, 'ggspectra' 0.1.0 and 'ggplot2' 2.0.0.

## photobiologySun 0.3.6

*  Add irradiance example time-series data.

## photobiologySun 0.3.5

*  Rebuild with 'photobiology' 0.8.5.

## photobiologySun 0.3.4

*  Add `gap.mspct` data.

## photobiologySun 0.3.3

*  Rebuild with 'photobiology' 0.8.0.

## photobiologySun 0.3.2

*  Added hourly spectral data for August.
*  Updated vignette.

## photobiologySun 0.3.1

*  Added hourly spectral data.
*  Updated vignette with an example of the use of these data.

## photobiologySun 0.3.0

*  Data rebuilt with 'photobiology' 0.6.0

## photobiologySun 0.2.1

*  Updated required version of 'photobiology' package to 0.5.15
*  Edited the vignette to use new high level functions from 'photobiologygg' 0.2.8

## photobiologySun 0.2.0

*  Updated required version of 'photobiology' package to 0.5.7
*  Edited the vignette to use new high level functions from 'photobiologygg' 0.2.5

## photobiologySun 0.1.4

*  Updated required version of 'photobiology' package.

## photobiologySun 0.1.3

*  Edited the script to use `.spct` as name tag for spectra instead of `.dt`.
*  Rebuilt with current versions of 'photobiology' and 'MayaCalc' packages.
*  Edited the vignette to make use of the new function `plot.source.spct()` specializing the `plot()` generic.

## photobiologySun 0.1.2

*  Now spectra are in `data.frame` and `data.table` compatible `"source.spct"` objects.

## photobiologySun 0.1.1

*  Added several standard spectra for extraterrestrial and terrestrial solar spectrum from WMO and ASTM. All data frames now include both spectral photon irradiance and spectral energy irradiance values.

## photobiologySun 0.1.0

*  Just one example spectrum.

