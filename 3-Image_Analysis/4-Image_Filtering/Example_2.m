img = imread('moon.tif');

ax1 = subplot(1,3,1);
image(img);
colormap(ax1, gray);
title('moon.tif');
axis tight; axis equal;

ax2 = subplot(1,3,2);
rng(0);
img_noisy = double(img) + 20*randn(size(img)); % random white noise artifacts with standard deviation of 20
image(img_noisy);
colormap(ax2, gray);
title('Noisy image');
axis tight; axis equal;

ax3 = subplot(1,3,3);
sigma = 1.5;
W = sigma * 6; % typically we would choose to filter width to be 6 times sigma
img_filtered = imgaussfilt(img, sigma, 'FilterSize', [W,W]);
image(img_filtered);
colormap(ax3, gray);
title(['Filtered image (\sigma = ', sprintf('%.1f', sigma), ')']);
axis tight; axis equal;