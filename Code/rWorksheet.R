##############################################################
#
# 2016 Statistics Bootcamp 
# Notes from the Lecture
#
setwd('/Users/bvegetabile/Dropbox/ucirvine/teaching/StatGradBootcamp/rData/')
# Vectors ----------------------------------------------------

a <- 0
b <- c(1,2,4)
c <- rep(5, 10)

truths <- c(T, F, T)
truths2 <- c(TRUE, FALSE, FALSE) # Not False

words <- c('hello', 'world')

bad.vector <- c(1, 'no')

vector.names <- c(a='A', b='C')

sum(truths)
summary(b)

as.character(b)
typeof(b)
as.integer(b)

#Factors --------------------------------------------------------

male.females <- rep(c('M', 'F'), 5)

factored.mf <- factor(male.females)

mf.levels <- levels(factored.mf)
mf.levels

table(male.females)

mf.unclass <- unclass(factored.mf)

relevel()

relevel(factored.mf, 'M')

# Matrices ----------------------------------------------------

colvec <- c(1,2,3,4)
mat1 <- matrix(colvec, nrow=2, ncol=2)

rownames(mat1) <- c('a', 'b')

vec1 <- 1:4
vec2 <- sample(1:100, 4, replace = FALSE)
vec3 <- rnorm(4, mean = 0, sd = 1)
colMat <- cbind(vec1, vec2, vec3)
colMat

# Lists

vec1 <- rep(c(1,2,3), 4)
mat1 <- matrix(vec1, 3,4)
chardata <- c('uci', 'statistics', 'bootcamp')

ourlist <- list(Vector = vec1,
                Matrix = mat1,
                Words = chardata)

# Data Frames

studentID <- paste("S#", sample(c(6473:7392), 10), sep = "")
score <- sample(c(0:100), 10)
gender <- sample(c("female", "male"), 10, replace = TRUE)
data <- data.frame(studentID = studentID, 
                   score = score, 
                   gender = gender)
head(data)



x <- 1:100
range <- (x < 95) & (x > 40)
x[range]

# Reading in data

playerData <- read.csv('playerInfo.csv', stringsAsFactors = F)
performanceData <- read.csv('performanceInfo.csv')

summary(playerData)
nrow(playerData)

summary(performanceData)
nrow(performanceData)

head(playerData$PlayerID)
head(performanceData$PlayerID)

# Let's merge the data files

baseball <- merge(playerData, performanceData, all=T,
                  by = 'PlayerID')

write.csv(baseball, file = 'statbootcampBaseball.csv', row.names = F)


# Control Loops in R

# Few Major Control Loops
# - For Loop
# - While Loop
our.mat <- matrix(rep(1:10, 10), 10, 10, T)
for(i in 1:10){
  print(our.mat[i, ])
}

x <- 0
i <- 1
while( x < 10 ){
  print(x)
  if(i == 100){break}
  i <- i + 1
}

# Logical comparisons

# If/Else statements

x <- 0
if(x == 1){
  print(paste('X = ', x, sep=''))
} else if (x == 0){
  print("This is a long class")  
} else {
  print(paste('X = ', x, sep=''))
}


# Demonstration of growing loops

start.time <- Sys.time()
storage <- c()
for(i in 1:50000){
  if(!(i %% 5000)){
    message(paste('Sample:', i))
  }
  new.val <- sample(c('a', 'b', 'c'), 1, replace=T)
  storage <- c(storage, new.val)
}
stop.time <- Sys.time()
print(stop.time - start.time)

start.time <- Sys.time()
storage <- rep(NA, 50000)
for(i in 1:50000){
  if(!(i %% 5000)){
    message(paste('Sample:', i))
  }
  new.val <- sample(c('a', 'b', 'c'), 1, replace=T)
  storage[i] <- new.val
}
stop.time <- Sys.time()
print(stop.time - start.time)




















