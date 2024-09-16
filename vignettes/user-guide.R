## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, 
                      fig.height=4,  
                      collapse = TRUE,
                      comment = "#>")

## ----message=FALSE------------------------------------------------------------
library(photobiology)
library(photobiologyWavebands)
library(photobiologySun)
library(lubridate)
eval_plots <- requireNamespace("ggspectra", quietly = TRUE)
if (eval_plots) library(ggspectra)
theme_set(theme_bw())

## -----------------------------------------------------------------------------
names(sun_reference.mspct)

## -----------------------------------------------------------------------------
sun_reference.mspct$Gueymard.AM0

## -----------------------------------------------------------------------------
sun_reference.mspct[["Gueymard.AM0"]]

## -----------------------------------------------------------------------------
sun_reference.mspct["Gueymard.AM0"]

## -----------------------------------------------------------------------------
sun_reference.mspct[grep("AM0", names(sun_reference.mspct), ignore.case = TRUE)]

## ----eval = eval_plots--------------------------------------------------------
autoplot(gap.mspct$spct.01)

## ----eval = eval_plots--------------------------------------------------------
ggplot(gap.mspct$spct.01, unit.out = "photon") +
  geom_line(linetype = "dashed")

## ----eval = eval_plots--------------------------------------------------------
autoplot(sun_hourly_august.spct, unit.out = "photon")

## -----------------------------------------------------------------------------
head(as.data.frame(gap.mspct$spct.01))

## -----------------------------------------------------------------------------
attach(gap.mspct)
q_irrad(gap.mspct$spct.01, Red())
detach(gap.mspct)

## -----------------------------------------------------------------------------
attach(gap.mspct)
with(spct.01, max(w.length))
detach(gap.mspct)

## -----------------------------------------------------------------------------
with(gap.mspct, q_response(spct.01, Red()))

