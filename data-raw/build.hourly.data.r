library(lubridate)
library(photobiology)
library(dplyr)
hourly.spct <- read.table(file="data-raw/hourly_spectra.txt", col.names = c("date", "time", "w.length", "s.e.irrad"))
hourly.spct <- mutate(hourly.spct, UTC = ymd(date) + seconds(trunc(time * 60)))
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
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-22 19:22"))
night23a.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-23 1:22"))
night23b.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-23 19:22"))
night24a.spct <- data_frame(w.length = 293:800, 
                            s.e.irrad = NA, 
                            UTC = ymd_hm("2010-06-24 1:22"))
sun_hourly_june.spct <- rbind(hourly.spct,
                                  night22b.spct,
                                  night23a.spct,
                                  night23b.spct,
                                  night24a.spct)
sun_hourly_june.spct <- mutate(sun_hourly_june.spct, EEST = with_tz(UTC, "EET"))
sun_hourly_june.spct <- subset(sun_hourly_june.spct, !is.na(w.length) & !is.na(UTC))
sun_hourly_june.spct <- setSourceSpct(sun_hourly_june.spct, multiple.wl = 58)

devtools::use_data(sun_hourly_june.spct, overwrite = TRUE)
