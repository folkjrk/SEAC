### working with dataframe

### read and inspect data -------------
### input
data = read.csv("data/winemag-data-130k-v2.csv", stringsAsFactors = FALSE)
# view data
View(data)
# number of rows and columns
dim(data)

### filtering data ------------------
### access specific columns
data$country
data[,c("X", "country")]
data[, grepl("X", names(data))]

### access specific rows
data[1:10,]

### filter data row based 
data[data$country=="Italy",] #italy
data[any(is.na(data$price)==TRUE),] #null value
data[data$points>95,] # score more than 95
data[data$region_1 %in% c("Sicilia", "Etna"),]

### calculating values --------------
### assigning filtered data to new items
italy <- data[data$country=="Italy",]

### calculating new column - point scaling
italy$points_sc <- italy$points / 10

### calculating new column - using conditionals
italy$point.range <- ifelse(italy$points>95, "High", "Low")

### save dataframe
write.csv(italy, "data/italy_r.csv", row.names=FALSE)

