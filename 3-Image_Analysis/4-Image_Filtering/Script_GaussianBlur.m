img = imread('moon.tif');

sigma = 20; 
[img_filt,filt] = GaussianBlur(img,sigma);

ax1 = subplot(2,2,1);
imagesc(img);
title('moon');
colormap(ax1, gray);

ax2 = subplot(2,2,2);
imagesc(img_filt);
title('moon blurred with sigma=20');
colormap(ax2, gray);

subplot(2,2,3);
surf(filt);
title('gaussian filter with sigma=20');