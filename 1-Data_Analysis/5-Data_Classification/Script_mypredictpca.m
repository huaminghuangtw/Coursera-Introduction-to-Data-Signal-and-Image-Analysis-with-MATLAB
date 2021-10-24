load fisheriris;
[~,~,class] = unique(species);

% Split into 50/50 training and testing data
D_train = meas(1:2:end,:);
class_train = class(1:2:end);
D_test = meas(2:2:end,:);
class_test = class(2:2:end);

% Create pca model struct with pca model for each class using the training set (This is what 'myfitpca' would do)
for i = 1 : 3
    [eigvects,~,eigvals,~,~,mu] = pca(D_train(class_train==i,:));
    mdl.class(i).eigvects = eigvects;
    mdl.class(i).eigvals = eigvals;
    mdl.class(i).mu = mu;
end

% Use our new function to estimate classification on the testing set
[class_est, score_est] = mypredictpca(mdl,D_test);
sum(class_est == class_test) / length(class_est)*100   % We should find 97.3333% classification accuracy!