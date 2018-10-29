### Simulations of the effect of the Central limit theorem. 
### Distribution used: Exponential. Mean = 1/\lambda, \sigma = 1/\lambda

library(ggplot2)

set.seed(142434)

lambda <- 0.2
n_means <- 40 
dist <- rexp(100, rate = lambda)

# Mean comparison 
print("Sample mean: "); print(mean(dist))
print("Theoretical mean: "); print( 1/lambda)

# Variance comparison
print("Sample variance: "); print(sd(dist)^2)
print("Theoretical variance: "); print(1/lambda^2)

mean_vals <- NULL
for (i in 1 : 1000) {
    mean_vals <-  c(mean_vals, mean(rexp(n_means, rate=lambda)))
}


dist_hist <- qplot(dist, binwidth=2)
mean_vals_hist <- qplot(mean_vals, binwidth=0.2)