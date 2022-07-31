###input
data = read.csv("/Users/astroxjrk/Desktop/SEAC/week8_R_Language/data/winemag-data-130k-v2.csv", 
                stringsAsFactors = FALSE)
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
italy_2$price.range <-ifelse(italy_2$price_usd > mean(italy_2$price_usd, na.rm = TRUE), 
                             "Expensive","Normal")
print(italy_2$price.range)

# 6  filter normal price wines only, plot the histogram of price converted and points
pts <- italy_2[italy_2$price.range == "Normal",]

hist(pts$price_usd)
max(pts$price_usd, na.rm=TRUE)
min(pts$price_usd, na.rm=TRUE)
median(pts$price_usd, na.rm=TRUE)

print(max(pts$price_usd, na.rm=TRUE))
text <- pasteO("Max:", max(pts$price_usd, na.rm=TRUE))
print(text)

# save dataset
write.csv(pts, " /Users/astroxjrk/Desktop/SEAC/week8_R_Language/data/normalpriceitaly.csv")

