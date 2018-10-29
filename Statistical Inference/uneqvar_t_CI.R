### Parameters

# Number of samples
n_new <- 100
n_old <- 100

# Means
X_new <- 4
X_old <- 6

# Standard errors
s_new <- 0.5
s_old <- 2

# Statistic
percent <- 97.5  /100
df      <- (n_new + n_old - 2)
t       <- qnorm(percent)
s_pool  <- sqrt( ((n_old - 1)*s_old^2 + (n_new - 1)*s_new^2)/(n_old + n_new - 2))

# Confidence interval
CI <- X_old- X_new + c(-1,1)*t*s_pool*sqrt(1/n_new + 1/n_old)

print(CI)