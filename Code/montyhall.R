library(ggplot2)

nsims <- 100

## Need a modified version of the sample function
resample <- function(x, ...) x[sample.int(length(x), ...)]

dat <- data.frame(stay = rep(NA, nsims), switch = NA)
for (i in 1:nsims) {
  doors <- 1:3
  car <- resample(doors, 1)
  goats <- doors[doors != car]
  
  pick <- resample(doors, 1)
  reveal <- resample(goats[goats != pick], 1)
  new_pick <- doors[(doors != reveal) & (doors != pick)]
  
  dat$stay[i] <- pick == car
  dat$switch[i] <- new_pick == car
}

ggplot() + emojifont::geom_emoji("goat", color='steelblue') +
  theme_void() 

colMeans(dat)
