gradients <- list(
    linear = list(
        blue = c(
            "#0000FF",
            "#007FFF",
            "#87CEFA",
            "#CFF8FF",
            "#F0FFFF",
            "#FFFFFF"
        ),
        grey = c(
            "#000000",
            "#333333",
            "#666666",
            "#999999",
            "#CCCCCC",
            "#FFFFFF"
        ),
        coral = c(
            "#FF4500",
            "#FF8674",
            "#F5CABF",
            "#FEF6F4",
            "#FFFFFF"
        ),
        green = c(
            "#00CF97",
            "#5AF5AC",
            "#BBFFDA",
            "#E1FFED",
            "#FFFFFF"
        )
    ),
    bipolar = list(
        green_coral = c(
            "#00CF97",
            "#FFFFFF",
            "#FF4500"
        ),
        blue_coral = c(
            "#0000FF",
            "#FFFFFF",
            "#FF4500"
        ),
        blue_green = c(
            "#0000FF",
            "#FFFFFF",
            "#00CF97"
        )
    ),
    multi = list(
        fsc = c(
            "#032559",
            "#0e569e",
            "#731e7e",
            "#fd36ce",
            "#ffadc4"
        ),
        spectrum = c(
            "#000000",
            "#0000FF",
            "#00CF97",
            "#FF4500",
            "#ffadc4"
        )
    )
)

usethis::use_data(gradients, internal = TRUE, overwrite = TRUE)
