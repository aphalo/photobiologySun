
library(photobiologyInOut)
library(lubridate)
library(dplyr)
library(devtools)

viikki_bio3.geo <- data.frame(lon = 25.019212, lat = 60.226805, address = "weather station, Viikki")

# col_names <- scan("data-raw/broad-band/CR6_HU_TableMinute.dat", 
#                   character(), nlines = 1, skip = 1, sep = ",")
# minute.data <- read.csv("data-raw/broad-band/CR6_HU_TableMinute.dat", 
#                         skip = 4, header = FALSE, col.names = col_names)
# names(minute.data)

# Be carefull with timezone!
# code below should be agnostic to local time zone where this script is run

minute.data <- read_csi_dat("data-raw/broad-band/CR6_HU_TableMinute.dat",
                            geocode = viikki_bio3.geo)

# minute.data$time_EET <- ymd_hms(minute.data$TIMESTAMP, tzone = "EET")
minute.data$time_EET <- force_tz(minute.data$TIMESTAMP, tzone = "EET")
minute.data$UTC <- with_tz(minute.data$time_EET, tzone = "UTC")

minute.data <- subset(minute.data,
                      time_EET > ymd_hms("2015-08-22 00:00:00 EET") &
                        time_EET < ymd_hms("2015-09-08 00:00:00 EET") )

diff(range(minute.data$time_EET))

comment(minute.data)

irrad_Kipp.data <- select(minute.data,
                          UTC,
                          time_EET,
                          e_irrad_mean = Solar_irrad_Avg,
                          e_irrad_max = Solar_irrad_Max,
                          e_irrad_min = Solar_irrad_Min,
                          e_irrad_sd = Solar_irrad_Std)

how_measured(irrad_Kipp.data) <- "Measured with Kipp & zonen SMP3 Pyranometer"
where_measured(irrad_Kipp.data) <- viikki_bio3.geo
what_measured(irrad_Kipp.data) <- "Global energy irradiance (W m-2). One-minute means."
comment(irrad_Kipp.data) <- "Small subset of a data set published at https://osf.io/e4vau/ doi:10.17605/OSF.IO/E4VAU."

minute.LICOR.summaries.data <- select(minute.data, 
                                      UTC,
                                      time_EET,
                                      ppfd_mean = PAR_Den_Avg,
                                      ppfd_max = PAR_Den_Max,
                                      ppfd_min = PAR_Den_Min,
                                      ppfd_sd = PAR_Den_Std)

ppfd_LICOR.data <- mutate(minute.LICOR.summaries.data,
                          ppfd_mean = ppfd_mean + 0.03,
                          ppfd_min = ppfd_min + 0.03,
                          ppfd_max = ppfd_max + 0.03)

how_measured(ppfd_LICOR.data) <- "Measured with LI-COR LI-190 PAR quantum sensor"
where_measured(ppfd_LICOR.data) <- viikki_bio3.geo
what_measured(ppfd_LICOR.data) <- "Photosynthetically active radiation, PAR (umol m-2 s-1). One-minute means."
comment(ppfd_LICOR.data) <- "Small subset of a data set published at https://osf.io/e4vau/ doi:10.17605/OSF.IO/E4VAU."

minute.BF.summaries.data <- select(minute.data, 
                                   UTC,
                                   time_EET,
                                   ppfd_tot_mean = PAR_BF_tot_Avg,
                                   ppfd_tot_min = PAR_BF_tot_Min,
                                   ppfd_tot_max = PAR_BF_tot_Max,
                                   ppfd_tot_sd = PAR_BF_tot_Std,
                                   ppfd_diff_mean = PAR_BF_diff_Avg,
                                   ppfd_diff_min = PAR_BF_diff_Min,
                                   ppfd_diff_max = PAR_BF_diff_Max,
                                   ppfd_diff_sd = PAR_BF_diff_Std)

ppfd_BF.data <- mutate(minute.BF.summaries.data,
                       UTC,
                       time_EET,
                       ppfd_tot_mean = ppfd_tot_mean - 0.7,
                       ppfd_tot_max = ppfd_tot_max - 0.7,
                       ppfd_tot_min = ppfd_tot_min - 0.7,
                       ppfd_diff_mean = ppfd_diff_mean - 0.81,
                       ppfd_diff_max = ppfd_diff_max - 0.81,
                       ppfd_diff_min = ppfd_diff_min - 0.81)

how_measured(ppfd_BF.data) <- "Measured with Delta-T BF5 Sunshine Sensor"
where_measured(ppfd_BF.data) <- viikki_bio3.geo
what_measured(ppfd_BF.data) <- "Photosynthetically active radiation, PAR (umol m-2 s-1). One-minute means."
comment(ppfd_BF.data) <- "Small subset of a data set published at https://osf.io/e4vau/ doi:10.17605/OSF.IO/E4VAU."

load("data-raw/broad-band/sun-four-days-1min-tb.rda")
sun_four_days_1min.tb[["UTC"]] <- sun_four_days_1min.tb[["time"]]
sun_four_days_1min.tb[["time_EET"]] <- with_tz(sun_four_days_1min.tb[["time"]], 
                                               tzone = "EET")
sun_four_days_1min.tb[["time"]] <- NULL
how_measured(sun_four_days_1min.tb) <- "Measured with broad-band sensors."
comment(sun_four_days_1min.tb) <- "Small subset of a data set published at https://osf.io/e4vau/ doi:10.17605/OSF.IO/E4VAU."
where_measured(sun_four_days_1min.tb) <- viikki_bio3.geo
what_measured(sun_four_days_1min.tb) <- "Photon irradiance for different wavebands measured with broadband sensors. One-minute means."

four_days_1min.data <- sun_four_days_1min.tb

save(ppfd_BF.data, ppfd_LICOR.data, irrad_Kipp.data, four_days_1min.data,
     file = "./data/broad-band.rda")

