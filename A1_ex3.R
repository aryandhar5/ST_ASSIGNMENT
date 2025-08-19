
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

## Residual vs Fitted 

plot(fitted(model1), resid(model1), main = "Residual vs Fitted", xlab = "Fitted values", ylab = "Residuals")
abline(h=0, lyt=2)


## added distinction level code

## FUNCTION 1 : HYPOTHESIS() - ## This function reads a dataset from a CSV file and prints the null (H0) and alternative (H1) 
## hypotheses for a simple linear regression analysis. It assumes the goal is to test whether 
## there is a statistically significant linear relationship between the predictor variable (X) 
## and the response variable (Y), using the slope coefficient β1.
## 
## Usage: hypothesis("your_data.csv")
## Output: Displays H0 and H1 statements for the specified dataset.
#---------------------------------------
hypothesis <- function(file_name){
  ## lets read the data
  data <- read.csv(file_name)
  cat("Hypothesis for", file_name, ":\n")
  cat("H0: β1 = 0 (no linear relationship between X and Y)\n")
  cat("H1: β1 ≠ 0 (linear relationship exists between X and Y)\n\n")
}

## FUNCTION 2 : Decision()
#----------------------------------------
decision <- function(fit_model){
  p_val <- summary(fit_model)$coefficients[2, "Pr(>|t|)"]
  if(p_val<0.05){
    cat("Decision -> Reject null hypothesis")
  }else{
    cat("Decision -> Failed to reject null hypothesis")
  }
}

## 