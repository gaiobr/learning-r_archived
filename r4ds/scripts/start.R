# Helsinki
setwd('Z:/GitHub/learning_r/r4ds')

library(nycflights13) # Database for tests
library(tidyverse)

# When we put a assignment to a var between parentheses, 
# the var is printed after the assignment
(jan1 = filter(flights, month == 1, day == 1))

# Logical operators
# OR |
filter(flights, month == 11 | month == 12)
# & and !
filter(flights, !arr_delay >= 120)

# Select
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))

select(flights, starts_with('arr'))
select(flights, ends_with('time'))
select(flights, contains('dep'))
# select(flights, num_range('x', 1:3)) # matches x1, x2 e x3

# rename()
rename(flights, tail_num = tailnum)

# everything()
# useful to move some columns for the start
select(flights, hour, minute, time_hour, everything())


#mutate()
# create a dataset with only some columns
flights_sml = select(flights,
                     year:day,
                     ends_with("delay"),
                     distance,
                     air_time
                     )

mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
       )

#transmute()
# keeps only the created columns
transmute(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)


#summarise
# group summaries
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

# with group_by() is more useful
by_day = group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))
