#X <- c(140, 138, 150, 148, 135)
#Y <- c(132, 135, 151, 146, 130)

#mu0 = mean(X)
#mu1 = mean(Y)

#print(t.test(X, y=Y, paired=TRUE))

#mu <- 1100
#sigma <- 30
#n <- 9
#t <- qt(0.975, df = n-1)
#print(mu + c(-1, 1)*t*sigma/sqrt(n))

#print(binom.test(3, n=4, alternativ="greater"))
    
#print(poisson.test(x=10, T=1787, r=1/100, alternative="less"))

#mu0 <- -3
#mu1 <- 1
#sigma0 <- 1.5
#sigma1 <- 1.8
#n0 <- 9
#n1 <- 9
#uneq_var_df <- ((sigma0^2/n2 + sigma1^2/n1)^2) / ((sigma0^2/n0)^2 * 1/(n0 -1) + (sigma1^2/n1)^2 * 1/(n1 - 1))

#print(pt(0.975,df = uneq_var_df))

alpha = 0.5
mu0 = 0
mua = 0.01
sigma =0.04
n = 100
z = qnorm(1 - alpha)
print(pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE))

print(power.t.test(n=100, delta=mua - mu0, sd = sigma, type="one.sample", alt="one.sided")) 
print(power.t.test(power=0.9, delta=mua - mu0, sd = sigma, type="one.sample", alt="one.sided")) 