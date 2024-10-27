# 1.(a)
## data
n <- 45  # Sample size
x_mean <- 920 
sigma <- 36  # Population standard deviation
z <- 1.645  # Z-value for 90% confidence level

lower_bound <- x_mean - z*(sigma/sqrt(n))
upper_bound <- x_mean + z*(sigma/sqrt(n))

## final result
cat("90% Confidence Interval for population mean:", lower_bound, "to", upper_bound, "\n")

# 1.(b)
## data
n <- 60  
x_bar <- 120  
sigma <- 32
z_90 <- 1.645 
z_95 <- 1.96
z_99 <- 2.576
### i.
margin_of_error_90 <- z_90 * (sigma / sqrt(n))

lower_bound_90 <- x_bar - margin_of_error_90
upper_bound_90 <- x_bar + margin_of_error_90

cat("90% Confidence Interval:", lower_bound_90, "to", upper_bound_90, "\n")
### ii.
margin_of_error_95 <- z_95 * (sigma / sqrt(n))

lower_bound_95 <- x_bar - margin_of_error_95
upper_bound_95 <- x_bar + margin_of_error_95

cat("95% Confidence Interval:", lower_bound_95, "to", upper_bound_95, "\n")
### iii.
margin_of_error_99 <- z_99 * (sigma / sqrt(n)) 

lower_bound_99 <- x_bar - margin_of_error_99
upper_bound_99 <- x_bar + margin_of_error_99

cat("99% Confidence Interval:", lower_bound_99, "to", upper_bound_99, "\n")
### iv.

# the margin of error increases, leading to wider confidence intervals.


# data
n <- 260
x_mean <- 42.6
sigma <- 5
u <- 42

# Z test
z <- (x_mean - u) / (sigma / sqrt(n))

p_value <- 1 - pnorm(z)
if (p_value <= 0.05) {
  cat("p_value:",p_value,"less or equal than 0.05, so we reject the null hypothesis at the 5% signficance level. \n")
} else {
  cat("p_value:",p_value,"greater or equal than 0.05, so we fail to reject the null hypothesis at the 5% signficance level. \n")
}

getwd()
setwd("C:/Users/15635/OneDrive/hku/Module2/msba7002/HW1")
data <- read.csv("ProdTime.dat")
head(data)
reg <- lm(Time.for.Run ~ Run.Size + Manager, data = data)
summary(reg)


reg_int <- lm(Time.for.Run ~ Run.Size*Manager,data = data)
summary(reg_int)


reg_inc <- lm(Time.for.Run ~ Run.Size + Manager,data = data)



library(ISLR)
library(ISLR2)
data("Auto")
summary(Auto)
pairs(Auto)

model1 <- lm(mpg ~ year, data = Auto)
summary(model1)

model2 <- lm(mpg ~ year + horsepower, data = Auto)
summary(model2)

par(mfrow=c(2,2)) 
plot(model2)


model3 <- lm(mpg ~ year * horsepower, data = Auto)
summary(model3)









adjusted_r_squared_continuous <- summary(model_continuous)$adj.r.squared
adjusted_r_squared_categorical <- summary(model_categorical)$adj.r.squared

cat("Adjusted R-squared (Continuous):", adjusted_r_squared_continuous, "\n")
cat("Adjusted R-squared (Categorical):", adjusted_r_squared_categorical, "\n")



library(ISLR)
library(leaps)
summary(Auto)
Auto$name <- NULL
model_all <- regsubsets(mpg ~ . , data = Auto, nvmax = 7, method = "exhaustive")
summary(model_all)

best_adjr2_model <- which.max(summary(model_all)$adjr2)
best_cp_model <- which.min(summary(model_all)$cp)
best_bic_model <- which.min(summary(model_all)$bic)

predictors_adjr2 <- names(coef(model_all, best_adjr2_model))
predictors_cp <- names(coef(model_all, best_cp_model))
predictors_bic <- names(coef(model_all, best_bic_model))

predictors_adjr2
predictors_cp
predictors_bic

formula_adjr2 <- as.formula(paste("mpg ~", paste(predictors_adjr2[-1], collapse = " + ")))
model_adjr2 <- lm(formula_adjr2, data = Auto)
summary(model_adjr2)

formula_cp <- as.formula(paste("mpg ~", paste(predictors_cp[-1], collapse = " + ")))
model_cp <- lm(formula_cp, data = Auto)
summary(model_cp)

formula_bic <- as.formula(paste("mpg ~", paste(predictors_bic[-1], collapse = " + ")))
model_bic <- lm(formula_bic, data = Auto)
summary(model_bic)


