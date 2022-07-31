### Intro to R language
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

## calculation
print(t+s)
print(t*s)
print(t/s)
print(t^s)

## series
series_1 <- c(1, 2, 3, 4, 5)
series_1[6] <- 7 #add number 7 in series_1
series_1[2] <- 5
series_1[1] <- 9

series_2 <- c(11, 22, 33, 44, 55)
x <- series_1 + series_2
mean<-mean(series_2)

## norm
norm<- rnorm(1000)
rnorm_1<- rnorm(1000, mean =1.5,sd = 2.5)
plot(rnorm_1)

# suggest example (rnorm)
example(rnorm)

## numeric character factor
texts <- c("1","2","3")
nums <- as.numeric(texts)

nums_1 <- c(99, 88, 77)
texts_1v <- as.character(nums_1)
texts_f <- as.factor(texts_1v) #categorical variable

first_eng <- c("A", "A", "B", "C")
first_eng_f <- as.factor(first_eng)

## matrix
matrix(first_eng, first_eng_f) # matrix only created in numeric
matrix(series_2, series_1) 

mat <- matrix(series_1,ncol =2 ) # Type"View(mat) in Console"

## Exercies_1
## 1. series from rnorm(10000)
## 2. matrix 100 row 100 col
num100 <-rnorm(10000)
mat100 <- matrix(num100, ncol=100) # Type"View(mat100) in Console"

#data frame
df <- as.data.frame(mat100)
df$v66
df$V101 <- df$V1 + df$V2
mean(df$V2)
max(df$V2) #OR [['V2]]
max(df[['V2']])

# Type in Console 
# df[1]
# df$V1
#df$V1[64]

plot(df$V2)
boxplot(df$V2) #OR [['V2]]
boxplot(df[['V2']])
hist(df$V2)

##data frame
df_2 <- data.frame(
  c(9,0,0),
  c(5,6,7),
  rnorm(3),
  c('V1','V2','V3'),
  row.names = c('V1','V2','V3')
)

#1.import Dataset form wine
#2.View(wine$price) in Console
#3.plot(wine$price) in Console
#4.boxplot(wine$price) in Console

##functions
math_plus = function(n1, n2){
  out = n1+n2
  return (out)
}

##  if else statement
out <- math_plus(7,9)
print(out)
if (out>15){
  out_t = "Yes"
  }else {
    out_t = "No"
  }

# mathplus(n1, n2, crit)
# if n1+ n2 > crit
#record output as "Yes otherwise "No"

math_plus_1 <- function(n1, n2, crit)
{
  res = n1+n2
  if(res>crit){
    out = "Yes"
  }else { 
    out = "NO"
  }
  return (out)
}

# insert math_plus_1(7,9,15) in Console 

## loops
sel = rnorm(20)
hist(sel)
res_sel = c()

for(i in 1:20){
  res_sel[i] <- sel[i] + 10
}
print(res_sel)


