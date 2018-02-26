rm(list = ls(pattern = "*"))

library(photobiology)
library(dplyr)

raw.path <- "data-raw/reference-spectra"

# ASTM AM0

E490.raw.data <- tbl_df(read.csv(paste(raw.path, "E490_00a_AM0.csv", sep = "/")))
ASTM_E490_AM0.spct <- transmute(E490.raw.data, 
                                w.length = Wavelength.microns * 1e3,
                                s.e.irrad = E.490.W.m2.micron * 1e3)
setSourceSpct(ASTM_E490_AM0.spct)

# set comment

comment(ASTM_E490_AM0.spct) <- "ASTM E490 (2000) AM0 standard (2004)\nExtraterrestrial solar spectrum\nAir mass zero (AM0)\nfrom http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html"
cat(comment(ASTM_E490_AM0.spct))
# save

# WMO Wehrli

WMO_Wehrli_AM0.spct <- transmute(E490.raw.data, 
                                 w.length = Wavelength.nm,
                                 s.e.irrad = Wehrli.W.m2.nm)
WMO_Wehrli_AM0.spct <- na.omit(WMO_Wehrli_AM0.spct)
setSourceSpct(WMO_Wehrli_AM0.spct)

comment(WMO_Wehrli_AM0.spct) <- "Wehrli's (1985) AM0\nExtraterrestrial solar spectrum\nAir mass zero (AM0)\nfrom http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html"
cat(comment(WMO_Wehrli_AM0.spct))

# ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2
# WMO Wehrli

ASTM_G173_AM1.5.spct <- read.csv(paste(raw.path, "ASTMG173.csv", sep = "/"), header=TRUE, comment.char = "#")

Gueymard_AM0.spct <- transmute(ASTM_G173_AM1.5.spct, 
                               w.length = w.length,
                               s.e.irrad = etr.s.e.irrad)
setSourceSpct(Gueymard_AM0.spct)

ASTM_G173_direct.spct <- transmute(ASTM_G173_AM1.5.spct, 
                                   w.length = w.length,
                                   s.e.irrad = direct.normal.s.e.irrad)
setSourceSpct(ASTM_G173_direct.spct)

ASTM_G173_global.spct <- transmute(ASTM_G173_AM1.5.spct, 
                                   w.length = w.length,
                                   s.e.irrad = global.s.e.irrad)
setSourceSpct(ASTM_G173_global.spct)

comment(Gueymard_AM0.spct) <- "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nExtraterrestrial solar spectrum of Gueymard (2004) \nUsed as a basis for ASTM G173 reference spectra\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/"
comment(ASTM_G173_direct.spct) <- "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/"
comment(ASTM_G173_global.spct) <- "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/"
cat(comment(Gueymard_AM0.spct))
cat(comment(ASTM_G173_direct.spct))
cat(comment(ASTM_G173_global.spct))

rm(ASTM_G173_AM1.5.spct) # its contents has been split into three separate spectra

# Construct a collection of spectra

object.names <- ls(pattern = "*.spct")
member.names <- gsub("_", ".", sub(".spct", "", object.names))

sun_reference.mspct <- list()
for (obj in object.names) {
  sun_reference.mspct[[gsub("_", ".", sub(".spct", "", obj))]] <- get(obj)
}

sun_reference.mspct <- as.source_mspct(sun_reference.mspct)

rm(list = object.names)

# save

save(sun_reference.mspct, file = "./data/sun-reference-mspct.rda")

