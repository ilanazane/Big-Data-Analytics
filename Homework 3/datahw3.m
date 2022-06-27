clear all
close all

load dataSet_1.mat

factors = glmfit(predictor,response,'binomial');
prob=glmval(factors, predictor, 'logit');
[X, Y, thre, AUC]=perfcurve(response, prob,1);
figure(1)
plot(X,Y)
[AUC]
 

predict_train = predictor(1:3000,:);
response_train  = response(1:3000,:);

predict_val = predictor(3001:4000,:);
response_val = response(3001:4000,:);

factors2 = glmfit(predict_train,response_train,'binomial');
prob2 = glmval(factors2,predict_train,'logit');
[X2,Y2,thre2,AUC2] = perfcurve(response_train,prob2,1);
figure(2)
plot(X2,Y2)
[AUC2]
%factors2 477x1
%predict_val 1000x476
%predict_train 3000x476
%response_train 3000x1
%%prob2 3000x1
prob3 = glmval(factors2,predict_val,'logit');
[X3,Y3,thre3,AUC3] = perfcurve(response_val,prob3,1);
figure(3)
plot(X3,Y3)
[AUC3]


