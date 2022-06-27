#import dataset from text, select csv 
install.packages("corrplot")
library(corrplot)

data = EE627A_HW1_Data
head(data)

data = subset(data, select = -c(Date) )

data.cor = cor(data)
data.cor
corrplot(data.cor)

#which factor correlates most highly with every industry? 
  #Market RF correlates highly with every industry 

#Which factor correlates negatively with every industry? 
  #Momentum correlates negatively with every industry 

#Does RF (Riskfreerate) correlate highly with 30 industry time series?
  #no it does not. based on the plot correlation between RF and the 30 industries is close to 0 

meanMarket = mean(data$Mkt.RF)
meanSMB = mean(data$SMB)
meanHMl = mean(data$HML)
meanMom = mean(data$Mom)



#AR(1) MODEL? NOT SURE
acf(data$Mkt.RF, lag.max = 10,type = c("correlation"),plot = TRUE, na.action = na.fail, demean = TRUE)
acf(data$Mkt.RF, pl=TRUE,lag.max = 10)#maybe
acf(data$SMB, pl=TRUE,lag.max = 10)#probably not
acf(data$HML, pl=TRUE,lag.max = 10) #probably, we can see from the plot that lag 1 is well above the 0.1 threshold, which means that it holds significance
acf(data$Mom, pl=TRUE,lag.max = 10)  #no

#HML is probably an AR(1) model because we see a significant spike at lag 1 (well above the 0.1 threshold)



