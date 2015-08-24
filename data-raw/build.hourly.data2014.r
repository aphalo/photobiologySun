library(lubridate)
library(photobiology)
library(dplyr)

first.day.spct <- read.table(file="data-raw/2014-08-21.hel", col.names = c("time", "w.length", "s.e.irrad"))
first.day.spct[["UTC"]] <-  with(first.day.spct, ymd("2014-08-21") + seconds(trunc(time * 60)))

second.day.spct <- read.table(file="data-raw/2014-08-22.hel", col.names = c("time", "w.length", "s.e.irrad"))
second.day.spct[["UTC"]] <-  with(second.day.spct, ymd("2014-08-22") + seconds(trunc(time * 60)))

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
sun_hourly_august.spct <- mutate(sun_hourly_august.spct, EEST = with_tz(UTC, "EET"))

sun_hourly_august.spct <- setSourceSpct(sun_hourly_august.spct, multiple.wl = 31)

devtools::use_data(sun_hourly_august.spct, overwrite = TRUE)

gap.wide.data <- read.table(file = "data-raw/HU_Robson/BPf1sun00000_irrad.txt", header = TRUE)

gap.mspct <- split2source_mspct(gap.wide.data, w.length.var = "wavelength",
                                comment = "Original data collected by T. Matthew Robson and Saara Hartikainen")

names(gap.mspct) <- paste("spct", 1:length(gap.mspct), sep = "_")
attr(gap.mspct, "when") <- c(ymd_hms("2014-04-30 11:09:46 EET"), ymd_hms("2014-04-30 11:10:25 EET"))
attr(gap.mspct, "time.step") <- 39 / length(gap.mspct)

devtools::use_data(gap.mspct, overwrite = TRUE)

