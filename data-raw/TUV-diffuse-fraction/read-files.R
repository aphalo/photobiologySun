rm(list = ls(pattern = "*"))
library(photobiology)
library(photobiologyInOut)

files <- list.files(path = "data-raw/TUV-diffuse-fraction/", 
                    pattern = "tuv", 
                    full.names = TRUE)

SZA.mspct <- source_mspct()

for (f in files) {
  name <- gsub("tuv-default-|-4str.htm|\\.htm", "", basename(f))
  print(name)
  SZA.mspct[[name]] <- read_qtuv_txt(f, ozone.du = 300)
  SZA.mspct[[name]][["sun.elevation"]] <- gsub("tuv-", "", name)
  what_measured(SZA.mspct[[name]]) <- "Clear sky solar spectrum at different sun elevations"
  how_measured(SZA.mspct[[name]]) <- "Simulated with the Quick TUV Calculator, ozone column: 300 DU"
}

sun_elevation.spct <- rbindspct(SZA.mspct, 
                                idfactor = "sun.elevation",
                                attrs.simplify = TRUE)

save(sun_elevation.spct, file = "./data/sun-elevation-spct.rda")
