#library dplyr 
# The easiest way to get dplyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just dplyr:
install.packages("dplyr")

#Call dplyr
library("dplyr")

#get data 
raw_data = read.csv("Users/astroxjrk/Desktop/SEAC/week8_R_Language/data/winemag-data-130k-v2.csv", stringsAsFactors = FALSE)
View(raw_data)

#select
select(raw_data, contains("Country"))
select(raw_data, contains(c("Country", "point", "price")))
dim(raw_data)

subset_data <-select(raw_data, contains(c("Country", "point", "price")))
dim(subset_data)

subset_data <- filter(subset_data, points>=90)
dim(subset_data)

#mutate
subset_data <- mutate(subset_data, 
                      avg_price = mean(subset_data$price, na.rm = TRUE))


#pipe operator (%>%) เพื่อเขียนเชื่อมโค้ด
#ใน RStudio ทิป – ฟังชั่น filter() สามารถใส่ได้มากกว่าหนึ่งเงื่อนไข โดยใช้ & หรือ | มาช่วย

subset_data_2 <- raw_data %>%
  select("country", "points", "price") %>%
  filter(points>=90) %>% 
  mutate(avg_price=mean(price, na.rm=TRUE)) %>%
  mutate(price_div = price - avg_price)

  # change to pipe Operation
  ## read data 
  # 1 filter data to be italy only
  italy_2 <- data[data$country == "Italy",]
  # 2 filter region 1 to be ("Sicilia", "Etna")
  italy_2 <- italy_2[italy_2$region_1 %in% c("Sicilia", "Etna"),]
  # 3 code to show dimension of filter data 
  print(dim(italy_2))
  # 4 create new column that is the conversion of price from euro to usd (1.02)
  italy_2$price_usd <- italy_2$price * 1.02
  # 5 create new column indicates price range, if price in usd > mean(priceusd) 
  # record "expensive" , then "Normal"
  italy_2$price.range <-ifelse(italy_2$price_usd > mean(italy_2$price_usd
                                                        , na.rm = TRUE), 
                               "Expensive","Normal")
  
#pipe operator for italy
View(raw_data)

italy_3 <- raw_data %>%
  filter(country=="Italy") %>%
  filter(region_1 %in% c("Sicilia", "Etna")) %>%
  mutate(price_usd=price*1.02) %>%
  mutate(price.range=ifelse(price_usd> mean(price_usd, na.rm =TRUE),
                            "Expensive","Normal"))
