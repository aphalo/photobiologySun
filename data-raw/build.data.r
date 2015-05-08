library(MayaCalc)
library(data.table)
library(photobiology)

oldwd <- setwd("data-raw")
sun_May_morning.spct <- process_maya_files("meas6n_short.txt", "dark6_short.txt",
                                           "pc6_long.txt", "meas6n_long.txt", "dark6_long.txt", method = "sun")
sun_May_morning.spct$s.q.irrad <- with(sun_May_morning.spct, as_quantum_mol(w.length, s.e.irrad))
setSourceSpct(sun_May_morning.spct)

# ASTM AM0

E490.raw.data <- read.csv("E490_00a_AM0.csv")
ASTM_E490_AM0.spct <- data.table(E490.raw.data[,1:2])
ASTM_E490_AM0.spct[ , w.length := Wavelength.microns * 1e3]
ASTM_E490_AM0.spct[ , s.e.irrad := E.490.W.m2.micron * 1e-3]
ASTM_E490_AM0.spct$s.q.irrad <- with(ASTM_E490_AM0.spct, as_quantum_mol(w.length, s.e.irrad))
ASTM_E490_AM0.spct$Wavelength.microns <- NULL
ASTM_E490_AM0.spct$E.490.W.m2.micron <- NULL
setSourceSpct(ASTM_E490_AM0.spct)

# set comment

setattr(ASTM_E490_AM0.spct, "comment", "ASTM E490 (2000) AM0 standard (2004)\nExtraterrestrial solar spectrum\nAir mass zero (AM0)\nfrom http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html")
cat(comment(ASTM_E490_AM0.spct))
# save

# WMO Wehrli

WMO_Wehrli_AM0.spct <- data.table(E490.raw.data[,c(3,6)])
WMO_Wehrli_AM0.spct[ , w.length := Wavelength.nm]
WMO_Wehrli_AM0.spct[ , s.e.irrad :=   Wehrli.W.m2.nm]
WMO_Wehrli_AM0.spct$s.q.irrad <- with(WMO_Wehrli_AM0.spct, as_quantum_mol(w.length, s.e.irrad))
WMO_Wehrli_AM0.spct$Wavelength.nm <- NULL
WMO_Wehrli_AM0.spct$Wehrli.W.m2.nm <- NULL
WMO_Wehrli_AM0.spct <- na.omit(WMO_Wehrli_AM0.spct)
setSourceSpct(WMO_Wehrli_AM0.spct)

setattr(WMO_Wehrli_AM0.spct, "comment", "Wehrli's (1985) AM0\nExtraterrestrial solar spectrum\nAir mass zero (AM0)\nfrom http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html")
cat(comment(WMO_Wehrli_AM0.spct))

# ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2
# WMO Wehrli

ASTM_G173_AM15.spct <- read.csv("ASTMG173.csv", header=TRUE, comment.char = "#")
setDT(ASTM_G173_AM15.spct)
Gueymard_AM0.spct <- ASTM_G173_AM15.spct[, list(w.length=w.length, s.e.irrad=etr.s.e.irrad, 
                                                s.q.irrad = as_quantum_mol(w.length, etr.s.e.irrad))]
setSourceSpct(Gueymard_AM0.spct)
ASTM_G173_direct.spct <- ASTM_G173_AM15.spct[, list(w.length=w.length, s.e.irrad=direct.normal.s.e.irrad,
                                                    s.q.irrad = as_quantum_mol(w.length, direct.normal.s.e.irrad))]
setSourceSpct(ASTM_G173_direct.spct)
ASTM_G173_global.spct <- ASTM_G173_AM15.spct[, list(w.length=w.length, s.e.irrad=global.s.e.irrad, 
                                                    s.q.irrad = as_quantum_mol(w.length, global.s.e.irrad))]
setSourceSpct(ASTM_G173_global.spct)

setattr(ASTM_G173_AM15.spct, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
setattr(Gueymard_AM0.spct, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nExtraterrestrial solar spectrum of Gueymard (2004) \nUsed as a basis for ASTM G173 reference spectra\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
setattr(ASTM_G173_direct.spct, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
setattr(ASTM_G173_global.spct, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
cat(comment(ASTM_G173_AM15.spct))
cat(comment(Gueymard_AM0.spct))
cat(comment(ASTM_G173_direct.spct))
cat(comment(ASTM_G173_global.spct))

# save

setwd(oldwd)


devtools::use_data(sun_May_morning.spct, ASTM_E490_AM0.spct, WMO_Wehrli_AM0.spct, Gueymard_AM0.spct, ASTM_G173_direct.spct, ASTM_G173_global.spct, overwrite = TRUE)

