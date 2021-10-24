function [class,score] = mypredictpca(mdl,data)
    % Initialize output 'class' and 'score' to r x 1 zero vectors
    [r,~] = size(data);
    class = zeros(r,1);
    score = zeros(r,1);
    % Loop over the r samples, to classify each 'i'th sample
    % In a nested loop, loop over each 'j'th class to compare the 'i'th sample to the 'j'th class
    % Within the loop, find the Mahalanobis distance from the 'i'th sample feature vector to the 'j'th class pca model        
    % The minimium Mahalanobis distance across the class pca models is used to choose our classification for the 'i'th sample
    % The classification and the Mahalanobis distance are stored in class(i) and score(i)
    for i = 1 : r
        mdscore = zeros(1,length(mdl.class));
        for j = 1 : length(mdl.class)
            mdscore(j) = MahalanobisDistance(mdl.class(j),data(i,:));
        end
        [score(i),class(i)] = min(mdscore);
    end
end