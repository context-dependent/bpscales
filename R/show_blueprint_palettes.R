#' Display defined Palettes
#'
#' @return a plot, showing all of the blueprint colour palettes.
#' @import ggplot2
#' @export
show_blueprint_palettes <- function() {
    d <- tibble::tibble()
    for (type in names(gradients)) {
        for (option in names(gradients[[type]])) {
            colors <- bp_ramp(300, type = type, option = option)
            m <- tibble::tibble(
                type = type,
                option = option,
                color = colors
            ) |> dplyr::mutate(i = dplyr::row_number())
            d <- dplyr::bind_rows(d, m)
        }
    }

    d |> ggplot(aes(.data$i, .data$option)) +
        facet_grid(type ~ ., scales = "free_y", space = "free_y") +
        geom_tile(fill = d$color) +
        scale_x_continuous(expand = expansion(0, 0))
}
