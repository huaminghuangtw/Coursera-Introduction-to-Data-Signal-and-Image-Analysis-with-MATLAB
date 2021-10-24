function [mse, R, p, rg] = EstimationErrorPlot(prediction, target)
    mse = mean((target-prediction).^2);
    figure;
    plot(target, prediction, 'r*');
    hold on;
    xlabel('True Value');
    ylabel('Mean Predicted Value');
    rg = [min([prediction;target]), max([prediction;target])];
    plot(rg,rg,'k--');
    [R,p] = corr(target, prediction);   % R: correlation coefficient (from -1 to 1); p: statistical significance
    title(sprintf('R=%.3f, p=%.3g, mse=%.3f', R, p, mse));
    legend('True vs. Predicted','Diagonal', 'Location', 'SouthEast');
end