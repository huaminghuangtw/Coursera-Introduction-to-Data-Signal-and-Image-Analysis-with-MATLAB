function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)
    % compute b, our PCA coordinates for v
    b = pcamdl.eigvects * (v - pcamdl.mu)';
    % compute std_per_mode, the standard deviation distance from the mean for v for each mode of variation
    std_per_mode = abs(b)./sqrt(pcamdl.eigvals);
    % compute md, the Mahalanobis distance
    md = sqrt(sum(std_per_mode.^2));
end