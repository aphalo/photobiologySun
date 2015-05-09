library(lubridate)
library(data.table)
library(photobiology)
hourly.spct <- read.table(file="data-raw/hourly_spectra.txt", col.names = c("date", "time", "w.length", "s.e.irrad"))
setDT(hourly.spct)
hourly.spct[ , UTC := ymd(date) + seconds(trunc(time * 60))]
hourly.spct[ , date := NULL]
hourly.spct[ , time := NULL]
hourly.spct[ , w.length := w.length / 10]
hourly.spct[ , s.e.irrad := s.e.irrad * 1e-3]

# The data set has no data for nights, so to make sure
# that this is clear to users, and to ensure that plotted
# lines get interrupted during nights, we insert NAs
# at the begging and end of the night.
# 
night22b.spct <- data.table(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-22 19:22"))
night23a.spct <- data.table(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-23 1:22"))
night23b.spct <- data.table(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-23 19:22"))
night24a.spct <- data.table(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-24 1:22"))
sun_hourly.spct <- rbindlist(list(hourly.spct,
                                  night22b.spct,
                                  night23a.spct,
                                  night23b.spct,
                                  night24a.spct))

sun_hourly.spct <- setSourceSpct(sun_hourly.spct, multiple.wl = 58)
setkey(sun_hourly.spct, UTC, w.length)

devtools::use_data(sun_hourly.spct, overwrite = TRUE)
