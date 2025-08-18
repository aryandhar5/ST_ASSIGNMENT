
### EXERCISE - 1

#### lets install necessary packages
install.packages("usethis")
library(tidyverse)
library(usethis)
install.packages("gitcreds")

#### Read the csv file vic_elect.csv into a tibble named X.

X <- read_csv("C:/Users/Aryan/Downloads/vic_elect.csv")

#### Display the structure of X using str(X).
str(X)

#### Calculate and display the total sum of all demand in the dataset.

total_demand_sum <- sum(X$demand, na.rm = TRUE)
cat("total sum of all demand in the dataset = ",total_demand_sum)

#### Calculate and display the average demand for all records where month is Jul.
average_demand_for_July <- mean(X$demand[X$month=='Jul'],na.rm = TRUE)
cat("the average demand for all records where month is Jul = ",average_demand_for_July)

#### Compute and show the median of demand of all records where temp is below 15.
meadian_of_demand_temp_below_15 <- median(X$demand[X$temp<15])

### Find the record with the highest demand, and display its corresponding year and month.
high_demand <- X[which.max(X$demand), c("year","month","demand")]
cat("high demand of",high_demand$demand,"occured in the year",high_demand$year,"and the month was",high_demand$month)
