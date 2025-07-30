library(photobiology)

list.dirs("./data-raw/greenhouse-spectra")
all.files <- list.files("./data-raw/greenhouse-spectra/",
                        pattern = ".*[Rr]da$",
                        recursive = TRUE,
                        full.names = TRUE)
for (f in all.files) {
  load(f)
}
rm(list = ls(pattern = ".*raw_mspct$"))

greenhouse.mspct <- collect2mspct()
rm(list = ls(pattern = ".*\\.spct$"))

save(greenhouse.mspct, file = "inst-not/greenhouse-mspct.rda")
