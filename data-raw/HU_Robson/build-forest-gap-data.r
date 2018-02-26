library(lubridate)
library(photobiology)
library(dplyr)

gap.wide.data <- read.table(file = "data-raw/HU_Robson/BPf1sun00000_irrad.txt", header = TRUE)

gap.mspct <- split2source_mspct(gap.wide.data, w.length.var = "wavelength",
                                comment = "Original data collected by T. Matthew Robson and Saara Hartikainen")

names(gap.mspct) <- paste("spct", 1:length(gap.mspct), sep = ".")
attr(gap.mspct, "when") <- c(ymd_hms("2014-04-30 11:09:46 EET"), ymd_hms("2014-04-30 11:10:25 EET"))
attr(gap.mspct, "time.step") <- 39 / length(gap.mspct)

save(gap.mspct, file = "./data/gap-mspct.rda")

