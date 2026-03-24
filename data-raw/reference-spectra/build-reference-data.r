
rm(list = ls(pattern = "*"))

library(photobiology)
library(photobiologyWavebands)
library(dplyr)
library(tibble)

energy_as_default()

raw.path <- "data-raw/reference-spectra"

# ASTM AM0 E490 -----------------------------------------------------------

read.csv(paste(raw.path, "E490_00a_AM0.csv", sep = "/")) |>
  as_tibble() |>
  transmute(w.length = Wavelength.microns * 1e3,
            s.e.irrad = E.490.W.m2.micron * 1e-3) |>
  setSourceSpct() -> ASTM_E490_AM0.spct

what_measured(ASTM_E490_AM0.spct) <- "AM0 extraterrestrial solar spectrum"
how_measured(ASTM_E490_AM0.spct) <- "Published data, originally from ASTM E490"
comment(ASTM_E490_AM0.spct) <- 
  paste0("ASTM E490 (2000) AM0 standard (2004)\n",
         "Extraterrestrial solar spectrum\n",
         "Air mass zero (AM0)\n",
         "from http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html")
cat(comment(ASTM_E490_AM0.spct))

summary(ASTM_E490_AM0.spct)
e_irrad(ASTM_E490_AM0.spct)

print(ASTM_E490_AM0.spct, n = 10)

# WMO Wehrli --------------------------------------------------------------

read.csv(paste(raw.path, "E490_00a_AM0.csv", sep = "/")) |>
  as_tibble() |>
  transmute(w.length = Wavelength.nm,
            s.e.irrad = Wehrli.W.m2.nm) |>
  na.omit() |>
  setSourceSpct() -> WMO_Wehrli_AM0.spct

what_measured(WMO_Wehrli_AM0.spct) <- "AM0 extraterrestrial solar spectrum"
how_measured(WMO_Wehrli_AM0.spct) <- "Published data, originally from Wehrli's (1985)"
comment(WMO_Wehrli_AM0.spct) <- 
  paste0("Wehrli's (1985) AM0\n",
         "Extraterrestrial solar spectrum\n",
         "Air mass zero (AM0)\n",
         "from http://rredc.nrel.gov/solar/spectra/am0/ASTM2000.html")
cat(comment(WMO_Wehrli_AM0.spct))

summary(WMO_Wehrli_AM0.spct)
e_irrad(WMO_Wehrli_AM0.spct)

print(WMO_Wehrli_AM0.spct, n = 10)


# ASTM G173-03 AM0 --------------------------------------------------------

# Reference Spectra Derived from SMARTS v. 2.9.2

read.csv(paste(raw.path, "ASTMG173.csv", sep = "/"),
         header = TRUE, comment.char = "#") |>
  as_tibble() |>
  transmute(w.length,
            s.e.irrad = etr.s.e.irrad) |>
  na.omit() |>
  setSourceSpct() -> Gueymard_AM0.spct

what_measured(Gueymard_AM0.spct) <- "AM0 extraterrestrial solar spectrum"
how_measured(Gueymard_AM0.spct) <- "Published data, originally from Gueymard (2004)"
comment(Gueymard_AM0.spct) <- 
  paste0("ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\n",
         "Extraterrestrial solar spectrum of Gueymard (2004)\n",
         "Used as a basis for ASTM G173 reference spectra\n",
         "from http://rredc.nrel.gov/solar/spectra/am1.5/")
cat(comment(Gueymard_AM0.spct))

summary(Gueymard_AM0.spct)
e_irrad(Gueymard_AM0.spct)

print(Gueymard_AM0.spct, n = 10)

# ASTM G173-03 AM1.5 Direct Normal -----------------------------------------

read.csv(paste(raw.path, "ASTMG173.csv", sep = "/"),
         header = TRUE, comment.char = "#") |>
  as_tibble() |>
  transmute(w.length,
            s.e.irrad = direct.normal.s.e.irrad) |>
  na.omit() |>
  setSourceSpct() -> ASTM_G173_direct.spct

what_measured(ASTM_G173_direct.spct) <- "AM1.5 direct normal terrestrial solar spectrum"
how_measured(ASTM_G173_direct.spct) <- "Published data, originally from ASTM G173-03"
comment(ASTM_G173_direct.spct) <- 
  paste0("ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\n",
         "Terrestrial solar spectrum\n",
         "Air mass 1.5 (AM1.5)\n",
         "(solar zenith angle 48.19, direct normal spectral irradiance)\n",
         "from http://rredc.nrel.gov/solar/spectra/am1.5/")
cat(comment(ASTM_G173_direct.spct))

summary(ASTM_G173_direct.spct)
e_irrad(ASTM_G173_direct.spct)
q_irrad(ASTM_G173_direct.spct, PAR(), scale.factor = 1e6)

print(ASTM_G173_direct.spct, n = 10)

# ASTM G173-03 AM1-5 Global ----------------------------------------------

read.csv(paste(raw.path, "ASTMG173.csv", sep = "/"),
         header = TRUE, comment.char = "#") |>
  as_tibble() |>
  transmute(w.length,
            s.e.irrad = global.s.e.irrad) |>
  na.omit() |>
  setSourceSpct() -> ASTM_G173_global.spct

what_measured(ASTM_G173_global.spct) <- "AM1.5 global terrestrial solar spectrum"
how_measured(ASTM_G173_global.spct) <- "Published data, originally from ASTM G173-03"
comment(ASTM_G173_global.spct) <- 
  paste0("ASTM G173-03 Reference Spectra Derived from SMARTS v. 2.9.2 AM1.5\n",
         "Terrestrial solar spectrum\n",
         "Air mass 1.5 (AM1.5)\n",
         "(solar zenith angle 48.19, global spectral irradiance)\n",
         "from http://rredc.nrel.gov/solar/spectra/am1.5/")
cat(comment(ASTM_G173_global.spct))

summary(ASTM_G173_global.spct)
e_irrad(ASTM_G173_global.spct)
q_irrad(ASTM_G173_global.spct, PAR(), scale.factor = 1e6)

print(ASTM_G173_global.spct, n = 10)

# Construct a collection of spectra ---------------------------------------

object.names <- ls(pattern = "*.spct")
member.names <- gsub("_", ".", sub(".spct", "", object.names))

sun_reference.mspct <- list()
for (obj in object.names) {
  sun_reference.mspct[[gsub("_", ".", sub(".spct", "", obj))]] <- get(obj)
}

sun_reference.mspct <- as.source_mspct(sun_reference.mspct)

rm(list = object.names)

library(ggspectra)
set_theme(theme_bw())

autoplot(sun_reference.mspct, range = c(200, 1100))
autoplot(sun_reference.mspct, geom = "spct",
         range = c(200, 1100), facets = 2)
autoplot(sun_reference.mspct, geom = "spct",
         range = c(200, 1100), facets = 2, unit.out = "photon")

# Save to data ------------------------------------------------------------

save(sun_reference.mspct, file = "./data/sun-reference-mspct.rda")
