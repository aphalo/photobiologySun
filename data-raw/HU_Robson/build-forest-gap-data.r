library(lubridate)
library(photobiology)
library(dplyr)

gap.wide.data <- read.table(file = "data-raw/HU_Robson/BPf1sun00000_irrad.txt", header = TRUE)

gap.mspct <- split2source_mspct(gap.wide.data, w.length.var = "wavelength",
                                comment = "Original data collected by T. Matthew Robson and Saara Hartikainen")

names(gap.mspct) <- sprintf("spct.%02d", 1:length(gap.mspct))

times <- c(ymd_hms("2014-04-30 11:09:46 EET"), ymd_hms("2014-04-30 11:10:25 EET"))
duration <- diff(times)
time_step <- duration / (length(gap.mspct) - 1)

when.measured <- ymd_hms("2014-04-30 11:09:46 EET") + seconds(0:(length(gap.mspct) - 1) * time_step)
what.measured <- "Light spectrum in the understory of a forest."

names(when.measured) <- names(gap.mspct)

for (n in names(gap.mspct)) {
  gap.mspct[[n]] <- setWhenMeasured(gap.mspct[[n]], when.measured[n])
  gap.mspct[[n]] <- setWhatMeasured(gap.mspct[[n]], what.measured)
}

attr(gap.mspct, "when") <- c(ymd_hms("2014-04-30 11:09:46 EET"), ymd_hms("2014-04-30 11:10:25 EET"))
attr(gap.mspct, "time.step") <- 39 / length(gap.mspct)

save(gap.mspct, file = "./data/gap-mspct.rda")

