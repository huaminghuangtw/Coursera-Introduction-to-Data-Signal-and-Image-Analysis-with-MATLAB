load('convhull.mat');

subplot(1,2,1);
imagesc(msk);

subplot(1,2,2);
convexhull = bwconvhull(msk);
imagesc(convexhull);
title('Convex Hull');

% Answer
% hexagon