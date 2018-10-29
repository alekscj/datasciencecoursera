### Parameters

# Number of samples
n <- 9

# Means
mean <- 1100

# Standard errors
s <- 30

# Statistic
percent <- 97.5  /100
df      <- n - 1
t       <- qt(percent, df)

# Confidence interval

CI <- mean + c(-1, 1)* t * s/sqrt(n)

