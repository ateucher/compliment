test_that("compliment() returns the right shape", {
  expect_type(compliment(), "character")
  expect_length(compliment(), 1)
  expect_length(compliment(3), 3)
  expect_named(compliment(2), NULL)
})

test_that("compliment() fills all template slots", {
  set.seed(4242)
  out <- compliment(50)
  expect_no_match(out, "\\{(adjective|noun)\\}")
})

test_that("non-integer n is rounded down", {
  expect_length(compliment(2.7), 2)
})

test_that("results are reproducible with set.seed()", {
  set.seed(1234)
  a <- compliment(5)
  set.seed(1234)
  b <- compliment(5)
  expect_identical(a, b)
})

test_that("invalid n errors", {
  expect_snapshot(compliment(0), error = TRUE)
  expect_snapshot(compliment("a"), error = TRUE)
})
