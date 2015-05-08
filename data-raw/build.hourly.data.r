library(lubridate)
library(photobiology)
one_day.spct <- read.table(file="data-raw/hourly_spectra.txt", col.names = c("date", "time", "w.length", "s.e.irrad"))
setDT(one_day.spct)
one_day.spct[ , UTC := ymd(date) + seconds(trunc(time * 60))]
one_day.spct[ , date := NULL]
one_day.spct[ , time := NULL]
one_day.spct[ , w.length := w.length / 10]
one_day.spct[ , s.e.irrad := s.e.irrad * 1e-3]
sun_hourly.spct <- setSourceSpct(one_day.spct, multiple.wl = length(unique(one_day.spct$UTC)))
setkey(sun_hourly.spct, UTC, w.length)

devtools::use_data(sun_hourly.spct, overwrite = TRUE)