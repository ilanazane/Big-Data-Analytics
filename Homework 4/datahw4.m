clear all
close all
clc 
load dataSet_2.mat
%load dataSet_1.mat
who

%predictor_train = predictor(1:3000,:);
%predictor_test = predictor(3001:end,:);
%response_train = response(1:3000);
%response_test = response(3001:end);


%generate new prediction matrix 

new_pred_train...
    = (predictor_train(2:3000,:)-predictor_train(1:2999,:))./predictor_train(1:2999,:);
new_resp_train = response_train(2:3000);

new_pred_test = ...
    (predictor_test(2:1000,:)-predictor_test(1:999,:))./predictor_test(1:999,:);
new_resp_test = response_test(2:1000);

all_pred_train = [predictor_train(2:3000,:) new_pred_train];
all_pred_test = [predictor_test(2:1000,:) new_pred_test];

%ans = featureSelection(all_pred_train,new_resp_train);

%ans = featureSelection(all_pred_train,new_resp_train);
[SelectedFeatureInd] = [427,386,134,239,467,113,6];

disp("hello")
selected_train_pred = all_pred_train(:,[349,825,121,140,534,400,281,81,490,424,458,36,199]);

selected_test_pred = all_pred_test(:,[349,825,121,140,534,400,281,81,490,424,458,36,199]);

new_factors_train = glmfit(selected_train_pred,new_resp_train,'binomial');
new_prob_train = glmval(new_factors_train,selected_train_pred,'logit');
new_prob_test = glmval(new_factors_train,selected_test_pred,'logit');

[xtrainnew,ytrainnew,thre1,auctrain] = perfcurve(new_resp_train,new_prob_train,1);
[xtestnew,ytestnew,thre2,auctest] = perfcurve(new_resp_test,new_prob_test,1);

figure(1)
plot(xtrainnew,ytrainnew,'-b',xtestnew,ytestnew,'-r')
[auctrain,auctest]



