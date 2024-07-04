## code to prepare `satisfaction` dataset goes here
n <- 100



b <- distributional::dist_beta(c(9, 2, 3, 4, 7, 1), c(3, 4, 1, 9, 2, 1))  |> 
  distributional::generate(1000)

age_sat <- b |> purrr::map(~ trunc(.x * 5) + 1L) |> 
  purrr::set_names(c("Under 25", "25-29", "30-39", "40-49", "50-64", "65+"))

satisfaction <- 
  tibble::tibble(
    participant_id = 1:1000,
    age = trunc(25 + rnorm(1000, sd = 3)), 
  ) |> 
  dplyr::mutate(
    age_cat = cut(
      age, 
      breaks = c(-Inf, 25, 30, 40, 50, 65, Inf), 
      labels = c("Under 25", "25-29", "30-39", "40-49", "50-64", "65+")
    ), 
  ) |> 
  dplyr::group_by(age_cat) |> 
  dplyr::group_nest() |> 
  dplyr::mutate(
    n = purrr::map_int(data, nrow), 
    satis_overall = purrr::map2(age_cat, n, ~ age_sat[[.x]][1:.y])
  ) |> 
  tidyr::unnest(cols = c(data, satis_overall)) |> 
  dplyr::mutate(
    satis_overall_fct = factor(
      satis_overall, 
      levels = 1:5, 
      labels = c("Very dissatisfied", "Dissatisfied", "Neutral", "Satisfied", "Very satisfied")
    )
  ) |> 
  dplyr::select(
    participant_id, 
    age, 
    age_cat, 
    satis_overall, 
    satis_overall_fct
  )

usethis::use_data(
  satisfaction, 
  overwrite = TRUE
)
