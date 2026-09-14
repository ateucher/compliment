.compliment_adjectives <- c(
  "brilliant",
  "clever",
  "delightful",
  "generous",
  "hilarious",
  "insightful",
  "resilient",
  "sparkling",
  "thoughtful",
  "unstoppable",
  "warm",
  "wise"
)

.compliment_nouns <- c(
  "cup of coffee on a cold morning",
  "favorite song coming on the radio",
  "firework finale",
  "first crocus of spring",
  "freshly baked loaf of bread",
  "library on a rainy day",
  "mountain lake at dawn",
  "perfect high five",
  "sunbeam breaking through the clouds",
  "supernova",
  "well-stocked bookstore",
  "well-tended garden"
)

.compliment_templates <- c(
  "You're as {adjective} as a {noun}.",
  "If {adjective} were a {noun}, it would be you.",
  "You have the kind of {adjective} energy that could light up a room, like a {noun}.",
  "Scientists agree: you're more {adjective} than the average {noun}.",
  "Somehow you make even ordinary Tuesdays feel {adjective}, like a {noun}.",
  "The day you showed up, the world got a little more {adjective} \u2014 basically a {noun}."
)

#' Generate a randomized compliment
#'
#' `compliment()` creates one or more randomized compliments by combining a
#' randomly chosen sentence template with randomly chosen adjectives and nouns.
#' Call `set.seed()` ahead of time if you need the flattery to be reproducible.
#'
#' @param n A single positive number of compliments to generate.
#'   Non-integers are rounded down.
#'
#' @return A character vector of length `n` containing compliments.
#'
#' @examples
#' compliment()
#'
#' set.seed(1234)
#' compliment(3)
#' @export
compliment <- function(n = 1) {
  if (!is.numeric(n) || length(n) != 1 || is.na(n) || n < 1) {
    stop("`n` must be a single positive number.", call. = FALSE)
  }
  n <- floor(n)
  vapply(
    seq_len(n),
    function(i) {
      template <- sample(.compliment_templates, 1)
      out <- gsub(
        "{adjective}",
        sample(.compliment_adjectives, 1),
        template,
        fixed = TRUE
      )
      gsub("{noun}", sample(.compliment_nouns, 1), out, fixed = TRUE)
    },
    character(1)
  )
}
