load fisheriris;
D_train = meas(1:2:end,:);
D_test = meas(2:2:end,:);
mdl = fitlm(D_train(:,1:3), D_train(:,4));
prediction = predict(mdl, D_test(:,1:3));
[mse,R,p,rg] = EstimationErrorPlot(prediction, D_test(:,4));