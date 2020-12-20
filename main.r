# importing libraries
library(readr)
library(ggcorrplot)
library(dplyr)
library(ggpubr)


# reading data
data <- read_csv("train.csv")
test <- read_csv("test.csv")


# variables
PRICE <- data$PRICE
AREA <- data$AREA
DISTANCE_F_C_C <-data$DISTANCE_F_C_C
FLOOR <- data$FLOOR
MAX_FLOOR <- data$MAX_FLOOR
WINDOWS <- data$WINDOWS
ROOMS <- data$ROOMS


# get mode function
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


# STAGE 1
# data visualization 
hist(PRICE)
hist(AREA)
hist(DISTANCE_F_C_C)
hist(FLOOR)
hist(MAX_FLOOR)
hist(WINDOWS)
hist(ROOMS)



# STAGE 2
# central tendency measures
# mean(PRICE)
mean(AREA)
mean(DISTANCE_F_C_C)
mean(FLOOR)
mean(MAX_FLOOR)
mean(WINDOWS)
mean(ROOMS)


getmode(PRICE)
getmode(AREA)
getmode(DISTANCE_F_C_C)
getmode(FLOOR)
getmode(MAX_FLOOR)
getmode(WINDOWS)
getmode(ROOMS)


median(PRICE)
median(AREA)
median(DISTANCE_F_C_C)
median(FLOOR)
median(MAX_FLOOR)
median(WINDOWS)
median(ROOMS)


# variability measures

range(PRICE)
range(AREA)
range(DISTANCE_F_C_C)
range(FLOOR)
range(MAX_FLOOR)
range(WINDOWS)
range(ROOMS)


IQR(PRICE)
IQR(AREA)
IQR(DISTANCE_F_C_C)
IQR(FLOOR)
IQR(MAX_FLOOR)
IQR(WINDOWS)
IQR(ROOMS)


var(PRICE)
var(AREA)
var(DISTANCE_F_C_C)
var(FLOOR)
var(MAX_FLOOR)
var(WINDOWS)
var(ROOMS)



sd(PRICE)
sd(AREA)
sd(DISTANCE_F_C_C)
sd(FLOOR)
sd(MAX_FLOOR)
sd(WINDOWS)
sd(ROOMS)




ggscatter(data, x = "AREA", y = "PRICE", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Area", ylab = "Price")

ggscatter(data, x = "WINDOWS", y = "ROOMS", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Area", ylab = "Price")


LM <- lm(PRICE ~ AREA + DISTANCE_F_C_C, data = data)
LM



model <-glm(PRICE ~ AREA + DISTANCE_F_C_C, data=data)

prediction <- predict(model, test)

prediction

write.csv(prediction,"predictions.csv", row.names = FALSE)

