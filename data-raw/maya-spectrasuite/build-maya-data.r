library(ooacquire)
library(photobiology)
# library(ggspectra)

oldwd <- setwd("./data-raw/maya-spectrasuite")

file.names <- list(light = c("meas6n_short.txt", "meas6n_long.txt"), 
                   dark = c("dark6_short.txt", "dark6_long.txt"),
                   filter = "pc6_long.txt")

sun_may_morning.spct <- s_irrad_corrected(file.names,
                                           descriptor = which_descriptor("2013-05-31",
                                                                         MAYP11278_descriptors),
                                           correction.method = MAYP11278_ylianttila.mthd)

# plot(sun_may_morning.spct, unit.out = "photon")

setWhatMeasured(sun_may_morning.spct, "Solar spectrum, clear with some clouds")
getWhenMeasured(sun_may_morning.spct)
setWhereMeasured(sun_may_morning.spct,
                 lon = 25.01673, 
                 lat = 60.2253, 
                 address = "Viikki, Helsinki, Finland")
trimInstrDesc(sun_may_morning.spct)
getInstrDesc(sun_may_morning.spct)
getInstrSettings(sun_may_morning.spct)
cat(comment(sun_may_morning.spct))

# save

setwd(oldwd)


save(sun_may_morning.spct, file = "./data/sun-may-morning-spct.rda")

