library(lubridate)
library(data.table)
library(photobiology)
first.day.spct <- read.table(file="data-raw/2014-08-21.hel", col.names = c("time", "w.length", "s.e.irrad"))
setDT(first.day.spct)
first.day.spct[ , UTC := ymd("2014-08-21") + seconds(trunc(time * 60))]

second.day.spct <- read.table(file="data-raw/2014-08-22.hel", col.names = c("time", "w.length", "s.e.irrad"))
setDT(second.day.spct)
second.day.spct[ , UTC := ymd("2014-08-22") + seconds(trunc(time * 60))]

hourly.spct <- rbindlist(list(first.day.spct, second.day.spct))
hourly.spct[ , time := NULL]
hourly.spct[ , w.length := w.length / 10]
hourly.spct[ , s.e.irrad := s.e.irrad * 1e-3]

# The data set has no data for nights, so to make sure
# that this is clear to users, and to ensure that plotted
# lines get interrupted during nights, we insert NAs
# at the begging and end of the night.
# 
night21.spct <- data.table(w.length = 290:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2014-08-21 19:22"))
night22.spct <- data.table(w.length = 290:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2014-08-22 1:22"))
sun_hourly_august.spct <- rbindlist(list(hourly.spct,
                                  night21.spct,
                                  night22.spct))

sun_hourly_august.spct[ , EEST :=  with_tz(UTC, "EET")]
sun_hourly_august.spct <- setSourceSpct(sun_hourly_august.spct, multiple.wl = 31)
setkey(sun_hourly_august.spct, UTC, w.length)

devtools::use_data(sun_hourly_august.spct, overwrite = TRUE)
