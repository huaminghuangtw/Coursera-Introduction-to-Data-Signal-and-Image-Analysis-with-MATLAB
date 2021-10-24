img = imread('cameraman.tif');

subplot(2,3,1);
hst = imhist(img);
threshold = otsuthresh(hst)*255
msk = (img < threshold);
imagesc(msk);
title('Original Image');
colormap(gray);

%% Method I
structuring_element = ones(7,7);

subplot(2,3,2);
% Erosion
msk_erode = imerode(msk, structuring_element);
imagesc(msk_erode);
title('Eroded Image');

subplot(2,3,3);
% Dilation
msk_erode_dilate = imdilate(msk_erode, structuring_element);
imagesc(msk_erode_dilate);
title('Eroded-Dilated Image');

%% Method II
subplot(2,3,6);
msk_opening = imopen(msk, structuring_element);
imagesc(msk_opening);
title('Eroded-Dilated Image');

%% Display the number of connected components in the resulting image
components1 = bwconncomp(msk_erode_dilate)
components2 = bwconncomp(msk_opening)
isequal(components1, components2)

% Answer
% 6