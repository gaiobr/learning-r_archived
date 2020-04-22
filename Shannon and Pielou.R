

## Verify that the packages are installed; if not, install them
# This is not a good solution because if we have a lot of packages installed it will be slow
# There are packages that implement solutions - search more
list_of_packages <- c("vegan")
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])] 
if (length(new_packages)) install.packages(new_packages)

library(vegan) # Community Ecology Package

# Data from -vegan package- used to study
data(BCI)

Shannon <- diversity(BCI)
Shannon

Pielou <- Shannon/log(specnumber(BCI))
Pielou
