img = imread('cameraman.tif');

subplot(2,5,1);
image(img);
title('Original Image');
colormap(gray);

subplot(2,5,2);
imhist(img);
hst = imhist(img);
threshold = otsuthresh(hst)
otsuthresh(hst)*255
hold on;
axis tight;
xline(threshold*255, '-.r', 'Threshold'); % Or: plot(threshold*255*[1,1], ylim, '-.r');

% Thresholding
subplot(2,5,6);
% Creates a binary image (i.e., mask) representing the segmentation
mask = (img < threshold*255);
imagesc(mask);
title('Thresholding');

subplot(2,5,7);
% To remove some of the small isolated noisy pixels:
% Chooses sigma, such that objects were smaller diameter in the segmentation,
% we would consider to be likely false positives. So here, we want our
% foreground structures to have a diameter of at least around 5 pixels
gaussianfilter = fspecial('gaussian', [30,30], 5);
mask_filtered = conv2(mask, gaussianfilter, 'same');
imagesc(mask_filtered);
title('Gaussian Filtered');
% Smaller structures have been dimmed by the filtering,
% but the larger structures are still bright

subplot(2,5,8);
% Re-threshold to the above Gaussian filtered result
mask_filtered_threshold = (mask_filtered > 0.5);
imagesc(mask_filtered_threshold);
title('Re-thresholding Gaussian Filtered');

% Connected component analysis
subplot(2,5,9);
components = bwconncomp(mask_filtered_threshold)
segmentation = zeros(size(mask));
segmentation(components.PixelIdxList{1}) = 1;
imagesc(segmentation);
title('Connected Component Analysis');

subplot(2,5,1);
hold on;
contour(segmentation, [0.5,0.5], 'r');

% Canny edge detection
subplot(2,5,10);
img_canny = edge(img, 'canny');
imagesc(img_canny);
title('Canny Edge Detection');