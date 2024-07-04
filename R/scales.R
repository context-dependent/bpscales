#' Colour and fill scales using Blueprint-branded palettes
#'
#' @rdname scale_blueprint
#'
#' @param type
#'   A character string indicating the type of color map to use.
#'   Three types are available:
#'   \itemize{
#'     \item \code{"linear"}
#'     \item \code{"bipolar"}
#'     \item \code{"multi"}
#'   }
#' @param option
#'   A character string indicating the specific palette
#'   Options are specific to type:
#'   \itemize{
#'     \item {
#'       \code{"linear"}
#'       \itemize{
#'         \item \code{"blue"} (default)
#'         \item \code{"green"}
#'         \item \code{"coral"}
#'       }
#'     }
#'     \item {
#'       \code{"bipolar"}
#'       \itemize{
#'          \item \code{"green_coral"} (default)
#'          \item \code{"blue_green"}
#'          \item \code{"blue_coral"}
#'       }
#'     }
#'     \item {
#'       \code{"multi"}
#'       \itemize{
#'          \item \code{"fsc"} (default)
#'       }
#'     }
#'   }
#' @param discrete
#'   Boolean value specifying whether the scale will be applied to
#'   discrete (TRUE) or continuous (FALSE) data.
#' @param alpha
#'   The alpha transparency, a number between 0 and 1 inclusive,
#'   see argument alpha in \code{\link[grDevices]{hsv}}.
#' @param begin
#'   The (corrected) hue, a number between 0 and 1 inclusive,
#'   at which the color map begins.
#' @param end
#'   The (corrected) hue, a number between 0 and 1 inclusive,
#'   at which the color map ends.
#' @param direction
#'   Sets the order of colors in the scale. If 1, the default,
#'   colors are ordered from darkest to lightest. If -1, the order of colors is
#'   reversed.
#' @param ...
#'   Other parameters passed to \code{\link[ggplot2]{discrete_scale}} or
#'   \code{\link[ggplot2]{scale_color_gradientn}},
#'   depending on the value of `discrete`
#'
#' @export
scale_color_blueprint <- scale_colour_blueprint <- function(
    ...,
    type = "linear",
    option = "blue",
    discrete = FALSE,
    alpha = 1,
    begin = 0,
    end = 1,
    direction = 1) {
    if (discrete) {
        ggplot2::discrete_scale(
            "color", "blueprint",
            bp_pal(type, option, alpha, begin, end, direction),
            ...
        )
    } else {
        ggplot2::scale_color_gradientn(
            colours = bp_ramp(
                256, type, option, alpha, begin, end, direction
            ), ...
        )
    }
}


#' @rdname scale_blueprint
#' @export
scale_fill_blueprint <- function(
    ...,
    type = "linear",
    option = "blue",
    discrete = FALSE,
    alpha = 1,
    begin = 0,
    end = 1,
    direction = 1) {
    if (discrete) {
        ggplot2::discrete_scale(
            "fill", "blueprint",
            bp_pal(type, option, alpha, begin, end, direction),
            ...
        )
    } else {
        ggplot2::scale_fill_gradientn(
            colours = bp_ramp(
                256, type, option, alpha, begin, end, direction
            ), ...
        )
    }
}

#' @rdname scale_blueprint
#' @export
bp_pal <- function(
    type = "linear",
    option = 1L,
    alpha = 1,
    begin = 0,
    end = 1,
    direction = 1) {
    function(n) {
        bp_ramp(n, type, option, alpha, begin, end, direction)
    }
}

#' @param n Integer. The number of distinct colour values to generate.
#' @rdname scale_blueprint
bp_ramp <- function(
    n,
    type = "linear",
    option = "blue",
    alpha = 1,
    begin = 0,
    end = 1,
    direction = 1) {
    if (direction == -1L) {
        temp <- begin
        begin <- end
        end <- temp
    }
    d <- grDevices::col2rgb(gradients[[type]][[option]]) / 255
    m <- grDevices::rgb(t(d))
    f <- grDevices::colorRamp(m, space = "Lab", interpolate = "spline")
    g <- f(seq(begin, end, length.out = n)) / 255
    grDevices::rgb(g[, 1], g[, 2], g[, 3], alpha = alpha)
}

#' @rdname scale_blueprint
#' @export
scale_x_pct <- function(
  ..., 
  expand = expansion(mult = c(0, 0.05)),
  limits = c(0, 1), 
  breaks = c(.25, .5, .75, 1), 
  labels = scales::percent_format(accuracy = 1)
) {
  scale_x_continuous(
    ..., 
    labels = labels, 
    limits = limits,
    expand = expand,
    breaks = breaks
  )
}