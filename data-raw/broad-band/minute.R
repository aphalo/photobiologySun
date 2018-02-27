library(lubridate)
library(dplyr)
library(devtools)

col_names <- scan("data-raw/broad-band/CR6_HU_TableMinute.dat", 
                  character(), nlines = 1, skip = 1, sep = ",")
minute.data <- read.csv("data-raw/broad-band/CR6_HU_TableMinute.dat", 
                        skip = 4, header = FALSE, col.names = col_names)
names(minute.data)
minute.data$time_EET <- ymd_hms(minute.data$TIMESTAMP)
minute.data <- subset(minute.data,
                      time_EET > ymd_hms("2015-08-22 00:00:00 EET") &
                        time_EET < ymd_hms("2015-09-08 00:00:00 EET") )

irrad_Kipp.data <- select(minute.data, time_EET,
                           e_irrad_mean = Solar_irrad_Avg,
                          e_irrad_max = Solar_irrad_Max,
                          e_irrad_min = Solar_irrad_Min,
                           e_irrad_sd = Solar_irrad_Std)
comment(irrad_Kipp.data) <- "Measured with Kipp & zonen SMP3 Pyranometer"

minute.LICOR.summaries.data <- select(minute.data, time_EET,
                                      ppfd_mean = PAR_Den_Avg,
                                      ppfd_max = PAR_Den_Max,
                                      ppfd_min = PAR_Den_Min,
                                      ppfd_sd = PAR_Den_Std)

ppfd_LICOR.data <- mutate(minute.LICOR.summaries.data,
                          ppfd_mean = ppfd_mean + 0.03,
                          ppfd_min = ppfd_min + 0.03,
                          ppfd_max = ppfd_max + 0.03)
comment(ppfd_LICOR.data) <- "Measured with LI-COR LI-190 PAR quantum sensor"

minute.BF.summaries.data <- select(minute.data, time_EET,
                                   ppfd_tot_mean = PAR_BF_tot_Avg,
                                   ppfd_tot_min = PAR_BF_tot_Min,
                                   ppfd_tot_max = PAR_BF_tot_Max,
                                   ppfd_tot_sd = PAR_BF_tot_Std,
                                   ppfd_diff_mean = PAR_BF_diff_Avg,
                                   ppfd_diff_min = PAR_BF_diff_Min,
                                   ppfd_diff_max = PAR_BF_diff_Max,
                                   ppfd_diff_sd = PAR_BF_diff_Std)

ppfd_BF.data <- mutate(minute.BF.summaries.data,
                       ppfd_tot_mean = ppfd_tot_mean - 0.7,
                       ppfd_tot_max = ppfd_tot_max - 0.7,
                       ppfd_tot_min = ppfd_tot_min - 0.7,
                       ppfd_diff_mean = ppfd_diff_mean - 0.81,
                       ppfd_diff_max = ppfd_diff_max - 0.81,
                       ppfd_diff_min = ppfd_diff_min - 0.81)
comment(ppfd_LICOR.data) <- "Measured with Delta-T BF5 Sunshine Sensor"

save(ppfd_BF.data, ppfd_LICOR.data, irrad_Kipp.data, file = "./data/broad-band.rda")

