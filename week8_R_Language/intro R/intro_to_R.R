# Intro to R language
print("Hello")
a <- 5
b <- 10
c = a+b

u <- 20
u <- "string"
v <- 200
x <-20.0

t<- 15
s<- 33

# calculation
print(t+s)
print(t*s)
print(t/s)
print(t^s)

# series
series_1 <- c(1, 2, 3, 4, 5)
series_2 <- c(11, 22, 33, 44, 55)
x <- series_1 + series_2
mean<-mean(series_2)

# norm
norm<- rnorm(1000)
rnorm_1<- rnorm(1000, mean =1.5,sd = 2.5)
plot(rnorm_1)

texts <- c("1","2","3")
nums <- as.numeric(texts)

nums_1 <- c(99, 88, 77)
texts_1v <- as.character(nums_1)
texts_f <- as.factor(texts_1v) #categorical variable

first_eng <- c("A", "A", "B", "C")
firsteng_f <- as.factor(first_eng)

# suggest example (rnorm)
example(rnorm)
