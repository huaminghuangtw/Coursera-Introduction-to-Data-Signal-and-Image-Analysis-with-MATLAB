load humanactivity.mat;
D = feat;   % [24075 x 60] matrix containing 60 feature measurements from 24075 samples

% Compute eigvals
[~,~,eigvals] = pca(D);

% Compute the cumulative_percent_variance_permode vector.
cumulative_percent_variance_permode = cumsum(eigvals/sum(eigvals)) * 100;

% Define N as the number of eigenvectors needed to capture at least 99.9% of the variation in D
N = find(cumulative_percent_variance_permode > 99.9, 1, 'first');