# Formatted correlation output with effect sizes ----

# Mar 25, 2019 in R • REPORT
# Tags: r easystats report correlations apa results
# Reference: https://easystats.github.io/blog/posts/report_correlation/
# Reference: https://easystats.github.io/blog/posts/report_anova/

# Install report ----
#devtools::install_github("easystats/report")  # Install the latest psycho version

# Load libraries ----
library(report)  # Load the package
library(dplyr)

# ___Correlation ----
df <- iris  # Load the traditional iris dataset into an object called df (for dataframe)
cor_results <- cor.test(df$Sepal.Length, df$Petal.Length)  # Compute a correlation and store its result

# Formatted output ----
report(cor_results)

# ___ANOVA ----
aov_results <- aov(Sepal.Length ~ Species, data=iris)  # Fit the ANOVA

# Formatted output ----
report(aov_results)

aov_results %>% 
  report() %>% 
  to_table()
