img = imread('moon.tif');

ax1 = subplot(1,3,1);
image(img);
colormap(ax1, gray);
title('moon.tif');
axis tight; axis equal;

ax2 = subplot(3,3,2);
sigma = 3; % many smaller details can be preserved
gaussianfilter = fspecial('gaussian', [90,90], sigma);
surf(gaussianfilter);
colormap(ax2, jet);
title(['Gaussian filter \sigma = ', num2str(sigma)]);

ax3 = subplot(3,3,3);
img_filtered = conv2(img, gaussianfilter, 'same');
image(img_filtered);
colormap(ax3, gray);
title('Filtered image');
axis tight; axis equal;

ax5 = subplot(3,3,5);
sigma = 9;
gaussianfilter = fspecial('gaussian', [90,90], sigma);
surf(gaussianfilter);
colormap(ax5, jet);
title(['Gaussian filter \sigma = ', num2str(sigma)]);

ax6 = subplot(3,3,6);
img_filtered = conv2(img, gaussianfilter, 'same');
image(img_filtered);
colormap(ax6, gray);
title('Filtered image');
axis tight; axis equal;

ax8 = subplot(3,3,8);
sigma = 15; % all of the fine details get blurred away
gaussianfilter = fspecial('gaussian', [90,90], sigma);
surf(gaussianfilter);
colormap(ax8, jet);
title(['Gaussian filter \sigma = ', num2str(sigma)]);

ax9 = subplot(3,3,9);
img_filtered = conv2(img, gaussianfilter, 'same');
image(img_filtered);
colormap(ax9, gray);
title('Filtered image');
axis tight; axis equal;