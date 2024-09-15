library(ggspectra)
library(photobiologyWavebands)

load("jokioinen-may-ozone-mspct.rda")

names(jokioinen_may_ozone.mspct)

spectra <- jokioinen_may_ozone.mspct[c(9, 25)]

names(spectra) <- gsub("2000-05-21-cmf100-|-10\\.jok", "", names(spectra))

autoplot(spectra, range = c(NA, 400))

autoplot(spectra, range = c(NA, 330))

autoplot(convolve_each(spectra, GEN_G()),
         range = c(NA, 330))

autoplot(convolve_each(spectra, PG()),
         range = c(NA, 330))

e_irrad(jokioinen_may_ozone.mspct[c(9, 25)], PhR())

