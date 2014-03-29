library(MayaCalc)

oldwd <- setwd("raw.data")
sun_May_morning.data <- process_maya_files("meas6n_short.txt", "dark6_short.txt",
                                           "pc6_long.txt", "meas6n_long.txt", "dark6_long.txt", method = "sun", decimal = ",")
setwd(oldwd)
save(sun_May_morning.data, file="~/Rpackages/photobiologySun/data/sun_May_morning.data.rda")
