########################################
#
# DATACAMP Course
# Name: https://campus.datacamp.com/courses/introduction-to-the-tidyverse
# Started: 2019-12-12
#
########################################



library(gapminder)
library(dplyr)


### filter()
# Using filter verb
gapminder %>%
  filter(year == 2007)

gapminder %>%
  filter(year == 2007, country == 'Belgium')

### arrange()
# Using arrange verb
gapminder %>%
  arrange(gdpPercap)

gapminder %>%
  arrange(desc(gdpPercap))

# Combine filter and arrange
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

### mutate()
# Using mutate verb
gapminder %>%
  mutate(pop = pop / 1000000)

# Combine filter, arrange and mutate
gapminder %>%
  filter(year == 2007) %>%
  mutate(lifeExpMonths = lifeExp * 12) %>%
  arrange(desc(lifeExpMonths))

