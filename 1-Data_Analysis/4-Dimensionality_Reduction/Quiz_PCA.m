load DimensionReduction.mat;
[~,D_pca] = pca(dataset);
round(max(D_pca(:,1)))
round(max(D_pca(:,2)))
scatter(D_pca(:,1), D_pca(:,2));

% Answer
% 1) 120
% 2) 12
% 3) exp(j*pi)+1=0