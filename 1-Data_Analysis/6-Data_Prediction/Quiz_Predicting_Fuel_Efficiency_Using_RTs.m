load carbig;
D = [Acceleration, Cylinders, Displacement, Horsepower, Model_Year, Weight];
y = MPG;
msk = ~ismissing(y);
D = D(msk,:);
y = y(msk);

D_train  = D(1:2:end,:);
y_train = y(1:2:end);

D_test = D(2:2:end,:);
y_test = y(2:2:end);
rng(0);

mdl = fitrtree(D_train, y_train, 'OptimizeHyperparameters', 'auto');
ypred = predict(mdl, D_test);
EstimationErrorPlot(ypred, y_test);

% Answer
% 1) fitrtree
% 2) 9.15