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


# case_when ---------------------------------------------------------------
# https://dplyr.tidyverse.org/reference/case_when.html

library(dplyr)

data(mtcars)
head(mtcars)

mtcars %>% 
  mutate(carb2 = case_when(
    carb > 5 | carb <= 2 ~ 'others',
    carb == 3 ~ 'three',
    carb == 4 ~ 'four'
  ))


# timetk ------------------------------------------------------------------
# https://www.business-science.io/code-tools/2020/06/05/timetk-vesion-2-announcement.html 
library(tidyverse)
library(lubridate)
library(timetk)

# Static ggplot
taylor_30_min %>%
  plot_time_series(date, value, .color_var = week(date),
                   .interactive = FALSE, .color_lab = "Week")

# INTERACTIVE Plotly
taylor_30_min %>%
  plot_time_series(date, value, .color_var = week(date),
                   .interactive = TRUE, .plotly_slider = TRUE, .color_lab = "Week")

# Visualize anomalies
walmart_sales_weekly %>%
  group_by(Store, Dept) %>%
  plot_anomaly_diagnostics(Date, Weekly_Sales, 
                           .facet_ncol = 3, .interactive = FALSE)

# Make a seasonality plot
taylor_30_min %>%
  plot_seasonal_diagnostics(date, value, .interactive = FALSE)

# Inspect autocorrelation, partial autocorrelation (and cross correlations too)
taylor_30_min %>%
  plot_acf_diagnostics(date, value, .lags = "1 week", .interactive = FALSE)

