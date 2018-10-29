library(datasets)
cars <- mtcars

#split_data <- split(cars, cars$cyl)
#cyl4 <- split_data$`4`
#cyl6 <- split_data$`6`

#mu1 <- mean(cyl4$mpg)
#mu2 <- mean(cyl6$mpg)

#print(t.test(cyl4$mpg, cyl6$mpg, var.equal=FALSE, conf.level=0.95))

#n  <- 100 
#mu <- 3
#sigma <- 1.1

#print(mu + c(-1, 1)*1.96*sigma/sqrt(n))

#heads <- 55
#n <- 100

#print(binom.test(heads, n, p=0.5, alternativ="greater"))

#x <- 15800
#time <- 30

#print(poisson.test(x, T = time, r = 520, alternative="greater"))

n <- 100
mu1 <- 10
mu2 <- 11
sigma <- 4

print(qnorm(0.95, mean=mu2 - mu1, sd = sigma*sqrt(2/n)))