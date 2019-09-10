library(ggplot2)

gradient_descent <- function(x0, f, grad_f, gamma, tol = 1e-3) {
  x_current <- x0
  x_new <- x_current - gamma * grad_f(x_current)
  results <- data.frame(x1 = x0[2], x2 = x0[2])
  while (norm(x_current - x_new, type = "2") > tol) {
    x_current <- x_new
    x_new <- x_current - gamma * grad_f(x_current)
    results[nrow(results) + 1, ] <- x_new
  }
  return(results)
}

f <- function(x) {
  x[1]^2 + 2 * x[2]^2 + x[1] - 1
}

grad_f <- function(x) {
  c(x[1] + 1, 4 * x[2])
}

results <- gradient_descent(c(1, 1), f, grad_f, 0.01)
plot_data <- expand.grid(x1 = seq(-1, 1, 0.05), x2 = seq(-1, 1, 0.05))
plot_data$val <- f(plot_data[, 1:2])[[1]]
head(plot_data)
ggplot(results) + 
  geom_point(aes(x = x1, y = x2), size = 0.3) + 
  stat_contour(data = plot_data, mapping = aes(x = x1, y = x2, z = val))
