test_that("Scales are correctly typed", {
  x <- scale_color_blueprint()
  expect_equal(x$scale_name, "gradientn")

  y <- scale_color_blueprint(discrete = TRUE)
  expect_equal(y$is_discrete(), TRUE)
})
