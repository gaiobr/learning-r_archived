# Helsinki
setwd('Z:/GitHub/learning_r/')


library(tidyverse)

# Load WDPA dataset
wdpa = read.csv('Z:/GitHub/research/wkpedia-global-nps/data/raw/WDPA_Dec2019-csv/WDPA_Dec2019-csv.csv', encoding = 'UTF-8')

bra_pa = wdpa %>%
  filter(ISO3 == 'BRA')

bra_np = bra_pa %>%
  filter(DESIG_ENG == 'Park', str_detect(ORIG_NAME, '̂Parque Nacional')) # Using REGEX

wdpa_clean(bra_np)
