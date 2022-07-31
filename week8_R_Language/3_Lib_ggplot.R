## ggplot2
# Alternatively, install just ggplot2:
install.packages("ggplot2")


library("ggplot2")

data = read.csv("/Users/astroxjrk/Desktop/SEAC/week8_R_Language/data/winemag-data-130k-v2.csv", 
                stringsAsFactors = FALSE)
data_c <- data
View(data_c)
plt <- ggplot(data_c, aes(x=price, y= points)) + 
  geom_point(aes(colour= country),
             alpha = 1/20,
             show.legend = FALSE) +
  geom_smooth() 
  labs(x='Selling Price', 
       y = 'Rating',
       title = 'Rating as a function of Selling Price') +
  scale_x_continuous(limits=c(0,1000))
  scale_y_continuous(limits=c(0,100))
  
#plt on console
#geom_point(aes(shape=country))

#plt <- plt +
  #geom_smooth()

# another method same solution
plt <- ggplot(data_c, aes(x=price, y=points))
plt <- plt +
  geom_point(aes(colour= country),
             alpha = 1/20,
             show.legend = FALSE) 
plt <- plt +
  geom_smooth() 
plt <- plt +
  labs(x='Selling Price', 
            y = 'Rating',
            title = 'Rating as a function of Selling Price')
plt<- plt +
  scale_x_continuous(limits=c(0,1000))
plt<- plt +
  scale_y_continuous(limits=c(0,100))

##

plt_2 <- ggplot(data_c, aes(x=country, y=price)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
plt_2

## Goal compare wine price between France and Swiss
library("dplyr")
hl <- data_c %>%
  filter(country %in% c('France', 'Switzerland'))

View(hl)

hl_plt <- ggplot(hl, aes(x=country,y = price)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
hl_plt

