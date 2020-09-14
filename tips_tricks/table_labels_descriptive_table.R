# Exploratory Analysis
# Descriptive Table

# install.packages('palmerpenguins')
# install.packages('labelled')
# install.packages('gtsummary')
install.packages('snakecase')

library(palmerpenguins) # data
library(stringr) # str_replace() and %>%
library(labelled) # set_variable_labels()
library(gtsummary) # tbl_summary and bold_labels()
library(snakecase) # to_title_case()


data("penguins")

penguins %>% str()

penguins %>% 
  set_variable_labels(
    .labels = str_replace(
      string = to_title_case(names(.)),
      pattern = 'Mm| g',
      replacement = c('Mm' = '(mm)', ' g' = ' (g)')
    )
  ) %>% 
  # make descriptive table
  tbl_summary(
    missing = 'no'
  ) %>% 
  bold_labels()

data("mtcars")

mtcars %>% 
  tbl_summary() %>% 
  bold_labels()
