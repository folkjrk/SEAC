## t-tests demo
library("dplyr")
library("ggplot")

data = read.csv("/Users/astroxjrk/Desktop/SEAC/week8_R_Language/data/winemag-data-130k-v2.csv", 
                stringsAsFactors = FALSE)
data_c <-data
hl <- data

hl_f <-hl %>%
  filter(country=="France")%>%
  select(price)
hl_s <- hl %>%
  filter(country=='Switzerland') %>%
  select(price)
hl_o <- data_c %>%
  filter(country!= "France") %>%
  select(price)

res_1 <- t.test(hl_f, hl_s,alternative = "two.sided",
       paired =FALSE)
res_1
res_2 <- t.test(hl_f, hl_o,alternative = "two.sided",
             paired =FALSE)
res_2

## linear regression 
# target: price 
# features: country, points

data_c_reg <- data_c %>%
  mutate(isFrance=ifelse(country== "France",1,0)) %>%
  mutate(isPinot=ifelse(variety == "Pinot Noir", 1,0))


#Models

reg <- lm(price~country+points, data = data_c)
summary(reg)

reg_1 <- lm(price~isFrance+isPinot+points, data = data_c_reg)
summary(reg_1)

boxplot(data_c_reg$price, factor(data_c_reg$isFrance))

factor(data_c_reg$variety)

