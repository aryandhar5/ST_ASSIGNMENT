
## Reading the data
data1 <- read_csv("A1_Ex3_signif.csv")
data2 <- read_csv("A1_Ex3_not_signif.csv")


## lets declare the hypotheses
# -------------------------------
# H0(NULL hypothesis) - β1 = 0 --> (No relationship between X and Y)
# H1 - β1 ≠ 0 --> (There is relationship between X and Y)

## Now lets check assumptions with the plots for data 1

model1 <- lm(Y ~ X, data=data1)

## Lets plot Y vs X regression line

plot(data1$X, data1$Y, main = "Y vs X", pch=18)
abline(model1, col="red", lwd=2)