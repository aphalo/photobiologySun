## ------------------------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=4)

## ------------------------------------------------------------------------
library(photobiology)
library(photobiologyWavebands)
library(photobiologySun)
library(ggplot2)
library(ggspectra)
library(lubridate)

## ------------------------------------------------------------------------
options(photobiology.plot.annotations =
          c("boxes", "labels", "colour.guide", "peaks", "title"))

## ------------------------------------------------------------------------
stepsize(WMO_Wehrli_AM0.spct)
range(WMO_Wehrli_AM0.spct)

## ------------------------------------------------------------------------
plot(WMO_Wehrli_AM0.spct, range=c(250, 2000), w.band = NULL)

## ------------------------------------------------------------------------
stepsize(ASTM_E490_AM0.spct)
range(ASTM_E490_AM0.spct)

## ------------------------------------------------------------------------
plot(ASTM_E490_AM0.spct, range=c(250, 2000), w.band = NULL)

## ------------------------------------------------------------------------
stepsize(Gueymard_AM0.spct)
range(Gueymard_AM0.spct)

## ------------------------------------------------------------------------
plot(Gueymard_AM0.spct, range=c(250, 2000), w.band = NULL)

## ------------------------------------------------------------------------
stepsize(ASTM_G173_direct.spct)
range(ASTM_G173_direct.spct)

## ------------------------------------------------------------------------
plot(ASTM_G173_direct.spct, range=c(250, 2000), w.band = NULL)

## ------------------------------------------------------------------------
stepsize(ASTM_G173_global.spct)
range(ASTM_G173_global.spct)

## ------------------------------------------------------------------------
plot(ASTM_G173_global.spct, range=c(250, 2000), w.band = NULL)

## ------------------------------------------------------------------------
stepsize(sun_May_morning.spct)
range(sun_May_morning.spct)

## ------------------------------------------------------------------------
plot(sun_May_morning.spct, annotations = c("+", "title:objct:when"))

## ------------------------------------------------------------------------
length(gap.mspct)
stepsize(gap.mspct[[1]])
range(gap.mspct[[1]])

## ------------------------------------------------------------------------
plot(rbindspct(gap.mspct[1:5]), annotations = c("-", "peaks")) +
  aes(linetype = spct.idx)

## ------------------------------------------------------------------------
plot(sun_May_morning.spct, annotations = c("+", "title:objct:when"))

## ------------------------------------------------------------------------
plot(subset(sun_hourly_august.spct, day(EEST) == 21 &
             hour(EEST) > 7 & 
              hour(EEST) < 13), 
     annotations = "colour.guide") +   
  facet_wrap(~EEST, ncol = 3)

## ------------------------------------------------------------------------
ppfd_label <- expression(PAR~~photon~~irradiance~~(mu*mol~s^{-1}~m^{-2}))
irrad_label <- expression(Global~~irradiance~~(W~m^{-2}))
time_label <- "Time EEST"
ppfd_labels <- labs(x = time_label, y = ppfd_label)
irrad_labels <- labs(x = time_label, y = irrad_label)

## ------------------------------------------------------------------------
ggplot(ppfd.LICOR.data, aes(time_EET, ppfd_mean)) + geom_line() +
  ppfd_labels

## ------------------------------------------------------------------------
ggplot(ppfd.BF.data, aes(time_EET, ppfd_tot_mean)) + geom_line() +
  ppfd_labels

## ------------------------------------------------------------------------
ggplot(ppfd.BF.data, aes(time_EET, ppfd_diff_mean)) + geom_line() +
  ppfd_labels

## ------------------------------------------------------------------------
ggplot(irrad.Kipp.data, aes(time_EET, e_irrad_mean)) + geom_line() +
  irrad_labels

## ------------------------------------------------------------------------
sunny.day.data <- subset(ppfd.LICOR.data, 
                           time_EET >= ymd_hms("2015-08-22 00:00:00") &
                             time_EET < ymd_hms("2015-08-23 00:00:00") )
ggplot(sunny.day.data, aes(time_EET, ppfd_max)) + 
  geom_area(fill = "orange", alpha = 0.3, colour = "tomato") +
  ylim(-0.3, 1600) + ppfd_labels

## ------------------------------------------------------------------------
cloudy.day.data <- subset(ppfd.LICOR.data, 
                           time_EET >= ymd_hms("2015-09-07 00:00:00") &
                             time_EET < ymd_hms("2015-09-08 00:00:00") )
ggplot(cloudy.day.data, aes(time_EET, ppfd_max)) + 
  geom_area(fill = "orange", alpha = 0.3, colour = "tomato") +
  ylim(-0.3, 1600) + ppfd_labels

