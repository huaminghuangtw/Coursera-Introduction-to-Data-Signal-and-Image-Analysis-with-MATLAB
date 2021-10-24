load humanactivity;
D_train = feat(1:2:end,:);
class_train = actid(1:2:end);
D_test = feat(2:2:end,:);
class_test = actid(2:2:end);

% Method I
mdl1 = myfitpca(D_train, class_train);
[class_est1, score_est1] = mypredictpca(mdl1, D_test);
accuracy1 = sum(class_est1 == class_test) / length(class_est1) * 100
figure(1);
EstimationErrorPlot(class_est1,class_test);

% Method II
mdl2 = fitlm(D_train, class_train);
class_est2 = round(predict(mdl2, D_test));
accuracy2 = sum(class_est2 == class_test) / length(class_est2) * 100
figure(2);
EstimationErrorPlot(class_est2,class_test);

function [mse,R,p,rg] = EstimationErrorPlot(prediction,target)
    mse = mean((target-prediction).^2);
    figure;
    plot(target,prediction,'r*');
    hold on;
    xlabel('True Value');
    ylabel('Mean Predicted Value');
    rg = [min([prediction;target]),max([prediction;target])];
    plot(rg,rg,'k--');
    [R,p] = corr(target,prediction);   % R: correlation coefficient (from -1 to 1); p: statistical significance
    title(sprintf('R=%.3f, p=%.3g, mse=%.3f', R, p, mse));
    legend('True vs. Predicted','Diagonal','Location','SouthEast');
end

% Answer
% 96.93