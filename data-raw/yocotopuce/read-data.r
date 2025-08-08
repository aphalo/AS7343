# channel by channel comparison of two different Yocto-Spectral
# one possibly with the factory calibration overwriten by mistake

library(dplyr)
library(ggplot2)
library(ggpmisc)
library(smatr)

suoniemi_01.tb <- read.csv("data-raw/yocotopuce/suoniemi-s01-01.csv", sep = ";")
suoniemi_02.tb <- read.csv("data-raw/yocotopuce/suoniemi-s02-01.csv", sep = ";")

colnames(suoniemi_01.tb)
head(suoniemi_01.tb$Local.time, 30)
head(suoniemi_02.tb$Local.time, 30)

suoniemi_s01_s02.tb <-
  full_join(suoniemi_01.tb, suoniemi_02.tb, by = "Local.time")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel13.avg.x < 500),
        aes(spectralChannel13.avg.x, spectralChannel13.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel12.avg.x < 500),
       aes(spectralChannel12.avg.x, spectralChannel12.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel11.avg.x < 500),
       aes(spectralChannel11.avg.x, spectralChannel11.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel10.avg.x < 500),
       aes(spectralChannel10.avg.x, spectralChannel10.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel9.avg.x < 500),
       aes(spectralChannel9.avg.x, spectralChannel9.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel8.avg.x < 500),
       aes(spectralChannel8.avg.x, spectralChannel8.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel7.avg.x < 500),
       aes(spectralChannel7.avg.x, spectralChannel7.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel6.avg.x < 500),
       aes(spectralChannel6.avg.x, spectralChannel6.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel5.avg.x < 500),
       aes(spectralChannel5.avg.x, spectralChannel5.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel4.avg.x < 500),
       aes(spectralChannel4.avg.x, spectralChannel4.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel3.avg.x < 500),
       aes(spectralChannel3.avg.x, spectralChannel3.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel2.avg.x < 500),
       aes(spectralChannel2.avg.x, spectralChannel2.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")

ggplot(subset(suoniemi_s01_s02.tb, spectralChannel1.avg.x < 500),
       aes(spectralChannel1.avg.x, spectralChannel1.avg.y)) +
  geom_point() +
  stat_poly_line(method = "sma", se = FALSE) +
  stat_poly_eq(mapping = use_label("eq", "R2", "n", "AIC"), method = "sma")
