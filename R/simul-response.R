#' Simulate spectral sensor response
#'
#' @param source.spct source_spct object Light source spectral irradiance.
#' @param responce.spct or response.mspct Light sensor spectral responsiveness,
#'   one or more channels.
#' @param range numeric vector of length two Range of wavelengths to use
#'   (nanometres, nm)
#' @inheritParams photobiology::response
#'
#' @details Compute sensor response spectrum by convolution of light source
#'   emission spectrum or illumination spectrum and the responsiveness spectrum
#'   of a sensor with one or more channels. Return the integral over wavelengths
#'   for each sensor channel.
#'
#' @export
#'
#' @examples
#' simul_response(sun.spct, ams_AS7343.spct)
#' simul_response(sun.spct, ccd.spct)
#' simul_response(sun.spct, ccd.spct, unit.out = "photon")
#'
simul_response <-
  function(source.spct,
           sensor.mspct,
           range = NULL,
           unit.out = getOption("photobiology.radiation.unit",
                                default = "energy"),
           quantity = "total",
           time.unit = NULL,
           scale.factor = 1) {

    if (!is.null(range)) {
      range <- range(range)
    }
    if (is.response_spct(sensor.mspct)) {
      sensor.mspct <- subset2mspct(sensor.mspct)
    }
    stopifnot("'source.spct' wrong class" = is.source_spct(source.spct))
    stopifnot("'sensor.mspct' wrong class" = is.response_mspct(sensor.mspct))
    source.spct <- trim_wl(source.spct, fill = 0)
    sensor.mspct <- trim_wl(sensor.mspct, fill = 0)

    channel.responses.mspct <- response_mspct()

    for (ch in names(sensor.mspct)) {
      channel.responses.mspct[[ch]] <- sensor.mspct[[ch]] * source.spct
    }

    z <- response(spct = channel.responses.mspct,
                  w.band = range,
                  unit.out = unit.out,
                  quantity = quantity,
                  time.unit = time.unit,
                  scale.factor = scale.factor)

    what_measured(z) <- paste("illumination: ", what_measured(source.spct),
                              "\nsensor: ", what_measured(sensor.mspct), sep = "")
    z
  }
