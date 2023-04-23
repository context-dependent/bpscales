test_that("bp_ramp produces the expected number of values", {
  colours <- bp_ramp(10)
  expect_equal(length(colours), 10)
})

test_that("bp_ramp is accessing the right colour palettes", {
  output_values <- c(
    bp_ramp(2, type = "linear", option = "blue")[1],
    bp_ramp(2, type = "bipolar", option = "green_coral")[2],
    bp_ramp(2, type = "multi", option = "fsc", direction = -1)[1]
  )

  correct_values <- c("#0000FFFF", "#FF4500FF", "#FFADC4FF")

  expect_equal(correct_values, output_values)
})
