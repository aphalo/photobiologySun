library(photobiology)

file.paths <- list.files(path = "data-raw/simulations-anders-ozone/", 
                         pattern = "[0-9]\\.jok$",
                         full.names = TRUE)

spectra <- list()
for (f in file.paths) {
  file.name <- basename(f)
  object.name <- gsub("2000-05-21-cmf100-|\\.jok", "", file.name)
  header <- scan(f, what = character(), nmax = 5)
  if (grepl("^[0-9]:", header[3])) {
    header[3] <- paste("0", header[3], sep = "")
  }
  time <- lubridate::ymd_hms(paste(header[2], header[3]))
  cat(file.name, ": ", format(time), "\n")                                 
  sun.elevation <- 90 - as.numeric(header[5])
  temp <-
    readr::read_table(
      file = f,
      col_names = c("minutes", "w.length", "s.e.irrad"),
      col_types = readr::cols(minutes = readr::col_number(),
                              w.length = readr::col_double(),
                              s.e.irrad = readr::col_double()),
      skip = 1,
      progress = FALSE
  )
  temp[["w.length"]] <- temp[["w.length"]] * 1e-1
  temp[["s.e.irrad"]] <- temp[["s.e.irrad"]] * 1e-3
  temp[["ozone"]] <- if (grepl("m20percO3", file.name)) "depleted 20%" else "normal"
  temp[["ozone"]] <- factor(temp[["ozone"]])
  temp[["sun.elevation"]] <- sun.elevation
  temp[["UTC"]] <- time
  temp <- as.source_spct(temp)
  what_measured(temp) <- "solar spectrum under a clear sky"
  when_measured(temp) <- time
  where_measured(temp) <- data.frame(lon = 23.48691, lat = 60.80560, address = "Jokioinen, Finland")
  how_measured(temp) <- "Simulated with libradtran by Anders Lindfors"
  spectra[[object.name]] <- temp
}

sun_hourly_ozone.mspct <- source_mspct(spectra)
names(sun_hourly_ozone.mspct)
summary(sun_hourly_ozone.mspct)

sun_hourly_ozone.spct <- rbindspct(sun_hourly_ozone.mspct, attrs.simplify = TRUE)

save(sun_hourly_ozone.spct, file = "./data/sun-hourly-ozone-spct.rda")
