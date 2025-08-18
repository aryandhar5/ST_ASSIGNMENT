
### EXERCISE 2

## Set the random seed: set.seed(2025)
set.seed(2025)

## By using a for loop, create a list X with N = 100 slots. In each slot, store a list containing two elements:
# 1. name, a character string in the format n_i, where i represents the slot number.
# 2. vect, a numeric vector of 5 elements sampled from a normal distribution with mean = 20 and std = 10

N <- 100
X <- list()

for(i in 1:N){
  X[[i]] <- list(
    name = paste("n_",i),
    vect = rnorm(5,mean=20,sd=10)
  )
}

## Display the structure of X using (str(X)).
str(X)

## Compute the sum of the values of vect in each slot and show the output by using a for loop. The output must be a vector of 100 values.

sum_of_vector <- numeric(N)
for(i in 1:N){
  sum_of_vector[i] <- sum(X[[i]]$vect, na.rm = TRUE)
  }
cat("sum of values of the vector =",sum_of_vector)

## Create a matrix M (not a data frame) of size 5 using the 100 vect objects stored in X by using a for loop.

M <- matrix(NA,nrow = 5, ncol = N) 
for(i in 1:N){
  M[, i] <- X[[i]]$vect
}

## Using a while loop, calculate and accumulate the column totals of M one by one until 
##the running sum exceeds 4000, then display the individual column totals, the final running sum, and the number of columns needed to reach this threshold.

running_sum <- 0       # cumulative sum
i <- 1                 # column index
N <- ncol(M)           # number of columns in M

# Create a vector to store individual column totals
column_totals <- numeric(0)

# While loop
while(running_sum <= 4000 && i <= N){
  col_total <- sum(M[, i], na.rm = TRUE)   # sum of current column
  column_totals <- c(column_totals, col_total)  # store the total
  running_sum <- running_sum + col_total   # update running sum
  cat("Column", i, "total =", col_total, "\n")  # display current column total
  i <- i + 1
}

# Displaying final results
cat("\nFinal running sum =", running_sum, "\n")
cat("Number of columns needed =", i-1, "\n")
