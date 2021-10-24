img = imread('tire.tif');

subplot(2,2,1);
imagesc(img);
colormap(gray);
title('tire.tif');
xlabel('Columns');
ylabel('Rows');
axis equal;
axis tight;

subplot(2,2,2);
imhist(img);
title('Histogram of grayscale intensity values');
%xlabel('Pixel intensity');
ylabel('Total pixel count');
axis tight;

subplot(2,2,3);
imgeq = histeq(img);
imagesc(imgeq);
axis equal;
axis tight;
title('Histogram equalized image');

subplot(2,2,4);
[pixelCount, grayLevels] = imhist(imgeq);
bar(grayLevels, pixelCount);
title('Histogram of grayscale intensity values');
xlabel('Pixel intensity');
ylabel('Total pixel count');
axis tight;