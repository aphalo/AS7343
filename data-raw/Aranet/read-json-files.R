library(jsonlite)
data.ls <- fromJSON("data-raw/Aranet/response_1754634350926.json")

str(data.ls)
class(data.ls$readings)
data.ls$readings$date.time <- lubridate::ymd_hms(data.ls$readings$time, tz = "Europe/Riga")

data.ls <- fromJSON("data-raw/Aranet/response_1754646733817.json")

str(data.ls)
class(data.ls$readings)
