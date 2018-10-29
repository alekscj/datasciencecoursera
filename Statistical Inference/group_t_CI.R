### Parameters

# Number of samples
n_new <- 9
n_old <- 9

# Means
X_new <- -3
X_old <- 1

# Standard errors
s_new <- 1.5
s_old <- 1.8

# Statistic
percent <- 95  /100
df      <- (n_new + n_old - 2)
t       <- qt(percent, df)
s_pool  <- sqrt( ((n_old - 1)*s_old^2 + (n_new - 1)*s_new^2)/(n_old + n_new - 2))

# Confidence interval
CI <- X_new - X_old + c(-1,1)*t*s_pool*sqrt(1/n_new + 1/n_old)

print(CI)

n1 <- n2 <- 9
x1 <- -3 ##treated
x2 <- 1 ##placebo
s1 <- 1.5 ##treated
s2 <- 1.8 ##placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
t2 <- qt(0.95, n1 + n2 - 2) 

print((x1 - x2) + c(-1, 1) * t2 * s * sqrt(1/n1 + 1/n2))
