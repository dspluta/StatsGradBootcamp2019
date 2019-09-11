### Functions for some probability distributions

## Normal
n <- 100
mu <- 2
sigma <- 3

# Generate a random sample and plot the histogram
x <- rnorm(n, mu, sigma)
hist(x, breaks = 30)

# Plot the pdf and cdf
curve(dnorm(x, mu, sigma), from = -5, to = 9)
curve(pnorm(x, mu, sigma), from = -5, to = 9, col = "red")

# Calculate quantiles
qnorm(0.95, mean = 0, sd = 1)
qnorm(0.975, mean = 0, sd = 1, lower.tail = FALSE)

## Binomial
n <- 100
size <- 10
p <- 0.3

x <- rbinom(n, size, p)
hist(x, breaks = 30)

curve(dbinom(x, size, p), from = 0, to = size, n = size + 1, ty = 'h')

## Geometric
n <- 100
p <- 0.8

x <- rgeom(n, p)
hist(x, breaks = 30)

curve(dgeom(x, p), from = 0, to = 20, n = 21, ty = 'h')

## Exponential
n <- 100
rate <- 0.5
x <- rexp(n, rate)
hist(x, breaks = 30)

curve(dexp(x, rate), from = 0, to = 10)
curve(pexp(x, rate), from = 0, to = 10)



