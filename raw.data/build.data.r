library(MayaCalc)
library(data.table)
library(photobiology)

oldwd <- setwd("raw.data")
sun_May_morning.dt <- process_maya_files("meas6n_short.txt", "dark6_short.txt",
                                           "pc6_long.txt", "meas6n_long.txt", "dark6_long.txt", method = "sun")
sun_May_morning.dt$s.q.irrad <- with(sun_May_morning.dt, as_quantum_mol(w.length, s.e.irrad))
sun_May_morning.dt$s.e.irrad.good <- NULL
setSourceSpct(sun_May_morning.dt)

# ASTM AM0

E490.raw.data <- read.csv("E490_00a_AM0.csv")
ASTM_E490_AM0.dt <- data.table(E490.raw.data[,1:2])
ASTM_E490_AM0.dt[ , w.length := Wavelength.microns * 1e3]
ASTM_E490_AM0.dt[ , s.e.irrad := E.490.W.m2.micron * 1e-3]
ASTM_E490_AM0.dt$s.q.irrad <- with(ASTM_E490_AM0.dt, as_quantum_mol(w.length, s.e.irrad))
ASTM_E490_AM0.dt$Wavelength.microns <- NULL
ASTM_E490_AM0.dt$E.490.W.m2.micron <- NULL
setSourceSpct(ASTM_E490_AM0.dt)

# set comment

setattr(ASTM_E490_AM0.dt, "comment", "ASTM E490 (2000) AM0 standard (2004)\nExtraterrestrial solar spectrum\nAir mass zero (AM0)\nfrom http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html")
cat(comment(ASTM_E490_AM0.dt))
# save

# WMO Wehrli

WMO_Wehrli_AM0.dt <- data.table(E490.raw.data[,c(3,6)])
WMO_Wehrli_AM0.dt[ , w.length := Wavelength.nm]
WMO_Wehrli_AM0.dt[ , s.e.irrad :=   Wehrli.W.m2.nm]
WMO_Wehrli_AM0.dt$s.q.irrad <- with(WMO_Wehrli_AM0.dt, as_quantum_mol(w.length, s.e.irrad))
WMO_Wehrli_AM0.dt$Wavelength.nm <- NULL
WMO_Wehrli_AM0.dt$Wehrli.W.m2.nm <- NULL
WMO_Wehrli_AM0.dt <- na.omit(WMO_Wehrli_AM0.dt)
setSourceSpct(WMO_Wehrli_AM0.dt)

setattr(WMO_Wehrli_AM0.dt, "comment", "Wehrli's (1985) AM0\nExtraterrestrial solar spectrum\nAir mass zero (AM0)\nfrom http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html")
cat(comment(WMO_Wehrli_AM0.dt))

# ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2
# WMO Wehrli

ASTM_G173_AM15.dt <- read.csv("ASTMG173.csv", header=TRUE, comment.char = "#")
setDT(ASTM_G173_AM15.dt)
Gueymard_AM0.dt <- ASTM_G173_AM15.dt[, list(w.length=w.length, s.e.irrad=etr.s.e.irrad, 
                                                s.q.irrad = as_quantum_mol(w.length, etr.s.e.irrad))]
setSourceSpct(Gueymard_AM0.dt)
ASTM_G173_direct.dt <- ASTM_G173_AM15.dt[, list(w.length=w.length, s.e.irrad=direct.normal.s.e.irrad,
                                                    s.q.irrad = as_quantum_mol(w.length, direct.normal.s.e.irrad))]
setSourceSpct(ASTM_G173_direct.dt)
ASTM_G173_global.dt <- ASTM_G173_AM15.dt[, list(w.length=w.length, s.e.irrad=global.s.e.irrad, 
                                                    s.q.irrad = as_quantum_mol(w.length, global.s.e.irrad))]
setSourceSpct(ASTM_G173_global.dt)

setattr(ASTM_G173_AM15.dt, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
setattr(Gueymard_AM0.dt, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nExtraterrestrial solar spectrum of Gueymard (2004) \nUsed as a basis for ASTM G173 reference spectra\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
setattr(ASTM_G173_direct.dt, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
setattr(ASTM_G173_global.dt, "comment", "ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\nTerrestrial solar spectrum\nAir mass 1.5 (AM1.5)\n(solar zenith angle 48.19 s)\nfrom http://rredc.nrel.gov/solar/spectra/am1.5/")
cat(comment(ASTM_G173_AM15.dt))
cat(comment(Gueymard_AM0.dt))
cat(comment(ASTM_G173_direct.dt))
cat(comment(ASTM_G173_global.dt))

# save

setwd(oldwd)

save(sun_May_morning.dt, ASTM_E490_AM0.dt, WMO_Wehrli_AM0.dt, Gueymard_AM0.dt, ASTM_G173_direct.dt, 
     ASTM_G173_global.dt, file="./data/solar_spectra.dt.rda")

