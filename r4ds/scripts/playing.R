### Playing

# unnest -----------------------------------------------------------------

library(tidyverse)
list_a <- list(1, 2, 3)
list_b <- list(list("a", "a"), list("b", "b"), list("c", "c"))
tb1 = tibble(a = list_a, b = list_b)

tb2 = tibble(a = list_a, b = list_b) %>%
  unnest(b)


# coalesce ----------------------------------------------------------------
# Use a single value to replace all missing values
x <- sample(c(1:5, NA, NA, NA))
coalesce(x, 5L)

# Or match together a complete vector from missing pieces
y <- c(1, 2, NA, 6, 5)
z <- c(NA, NA, 3, 4, 5)
coalesce(y, z)

# Supply lists by splicing them into dots:
vecs <- list(
  c(1, 2, NA, NA, 5),
  c(NA, NA, 3, 4, 5)
)
coalesce(!!!vecs)
