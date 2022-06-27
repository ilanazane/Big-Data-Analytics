library(lubridate)
library(ggplot2)

data =  Q2
head(data)
#plot proudces daily change 
plot(data$V1, type = "l")

#DATA 2 
acf(data$V1, pl=TRUE,lag.max = 20)
#this is an MA model,specifically MA(3)
pacf(data$V1, pl=TRUE,lag = 20)

model1 = arima(data$V1,c(0,0,3))
acf(model1$residuals)
pacf(model1$residuals)

#DATA 3 
data2 = Q3
#data2 = data2$V1

acf(data2$V1, pl=TRUE,lag.max = 10)
#there is a significant positive trend with ACF 
pacf(data2$V1, pl=TRUE,lag = 10)
#with PACF we see a more concise and clear plot that shows us that the first lag is 
#statistically significant 