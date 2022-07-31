## Caret : classification and Regression Training

data = read.csv("/Users/astroxjrk/Desktop/SEAC/week8_R_Language/data/winemag-data-130k-v2.csv", 
                stringsAsFactors = FALSE)
data_c <-data
data_c_reg <- data_c %>%
  mutate(isFrance=ifelse(country== "France",1,0)) %>%
  mutate(isPinot=ifelse(variety == "Pinot Noir", 1,0))

#install
install.packages('caret')
install
library("caret")
library("dplyr")

set.seed(100) 

reg_df <- data_c_reg
#include only non NA rows
#reg_df <- reg_df[is.na(reg_df)==FALSE,]
reg_df <- reg_df[complete.cases(reg_df), ]

#spilt to train and test sets
inTrain <- createDataPartition(
  y = reg_df$price,
  ## the outcome data are needed
  p = .80,
  ## The percentage of data in the
  ## training set
  list = FALSE
)

training <- reg_df[ inTrain,]
testing <- reg_df[-inTrain,]

#develop model on the training set
fitmod <- train(
  price ~ isFrance+isPinot+points,
  data = training,
  method = "glmnet",
  preProc = c("center", "scale")
)

# prediction
pred <- predict(fitmod, newdata=testing)
plot(pred)

dev <- testing$price - pred
