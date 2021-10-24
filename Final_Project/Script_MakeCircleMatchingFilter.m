diameter = 20;
W = 30;
[filter, xc, yc] = MakeCircleMatchingFilter(diameter, W);
figure; imagesc(filter); colormap(gray);
xc % should be 15.5
yc % should be 15.5

diameter = 20;
W = 31;
[filter, xc, yc] = MakeCircleMatchingFilter(diameter, W);
figure; imagesc(filter); colormap(gray);
xc % should be 16
yc % should be 16