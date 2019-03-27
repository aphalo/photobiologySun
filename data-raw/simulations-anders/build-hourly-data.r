library(lubridate)
library(photobiology)
library(dplyr)


# June 2010 ---------------------------------------------------------------


hourly.spct <- read.table(file="./data-raw/simulations-anders/hourly_spectra.txt",
                          col.names = c("date", "time", "w.length", "s.e.irrad"))
hourly.spct <- mutate(hourly.spct, UTC = as.POSIXct(ymd(date)) + seconds(trunc(time * 60)))
hourly.spct <- transmute(hourly.spct,
                         w.length = w.length * 1e-1,
                         s.e.irrad = s.e.irrad * 1e-3,
                         UTC = UTC)

# The data set has no data for nights, so to make sure
# that this is clear to users, and to ensure that plotted
# lines get interrupted during nights, we insert NAs
# at the begging and end of the night.
# 
night22b.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA_real_, 
                            UTC = ymd_hm("2010-06-22 19:22"))
night23a.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA_real_, 
                            UTC = ymd_hm("2010-06-23 1:22"))
night23b.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA_real_, 
                            UTC = ymd_hm("2010-06-23 19:22"))
night24a.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA_real_, 
                            UTC = ymd_hm("2010-06-24 1:22"))
sun_hourly_june.spct <- rbind(hourly.spct,
                                  night22b.spct,
                                  night23a.spct,
                                  night23b.spct,
                                  night24a.spct)

rm(hourly.spct, night22b.spct, night23a.spct, night23b.spct, night24a.spct)

# sun_hourly_june.spct <- mutate(sun_hourly_june.spct, EEST = with_tz(UTC, "EET"))
sun_hourly_june.spct <- subset(sun_hourly_june.spct, !is.na(w.length) & !is.na(UTC))
sun_hourly_june.spct <- setSourceSpct(sun_hourly_june.spct, 
                                      multiple.wl = 58,
                                      idfactor = "UTC")
setWhereMeasured(sun_hourly_june.spct, 
                 geocode = data.frame(lat = 60.20388, 
                                      lon = 24.96082, 
                                      address = "Kumpula, Helsinki, Finland"))
setWhatMeasured(sun_hourly_june.spct,
                "Radiation transfer model (LibRadtran) simulation of solar spectrum\nby Anders K. Lindfors")


# August 2014 -------------------------------------------------------------

first.day.spct <- read.table(file="data-raw/simulations-anders/2014-08-21.hel", col.names = c("time", "w.length", "s.e.irrad"))
first.day.spct[["UTC"]] <-  with(first.day.spct, as.POSIXct(ymd("2014-08-21")) + seconds(trunc(time * 60)))

second.day.spct <- read.table(file="data-raw/simulations-anders/2014-08-22.hel", col.names = c("time", "w.length", "s.e.irrad"))
second.day.spct[["UTC"]] <-  with(second.day.spct, as.POSIXct(ymd("2014-08-22")) + seconds(trunc(time * 60)))

hourly.spct <- rbind(tbl_df(first.day.spct), tbl_df(second.day.spct))
hourly.spct <- transmute(hourly.spct, 
                         w.length = w.length * 1e-1,
                         s.e.irrad = s.e.irrad * 1e-3, 
                         UTC = UTC)
# The data set has no data for nights, so to make sure
# that this is clear to users, and to ensure that plotted
# lines get interrupted during nights, we insert NAs
# at the start and end of the night.
# 
night21.spct <- data_frame(w.length = 290:800,
                           s.e.irrad = NA, 
                           UTC = ymd_hm("2014-08-21 19:22"))
night22.spct <- data_frame(w.length = 290:800, 
                           s.e.irrad = NA, 
                           UTC = ymd_hm("2014-08-22 1:22"))
sun_hourly_august.spct <- rbind(hourly.spct, night21.spct, night22.spct)
# sun_hourly_august.spct <- mutate(sun_hourly_august.spct, EEST = with_tz(UTC, "EET"))

sun_hourly_august.spct <- setSourceSpct(sun_hourly_august.spct, 
                                        multiple.wl = 31,
                                        idfactor = "UTC")
setWhereMeasured(sun_hourly_august.spct, 
                 geocode = data.frame(lat = 60.20388, 
                                      lon = 24.96082, 
                                      address = "Kumpula, Helsinki, Finland"))
setWhatMeasured(sun_hourly_august.spct,
                "Radiation transfer model (LibRadtran) simulation of solar spectrum\nby Anders K. Lindfors")

save(sun_hourly_june.spct, sun_hourly_august.spct,
     file = "./data/sun-hourly-spct.rda")
