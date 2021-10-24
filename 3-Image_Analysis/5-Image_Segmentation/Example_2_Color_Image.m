img = imread('peppers.png');

addpath('../Image_Intensity_and_Color_Distributions');
run('Example_3_Color_Image_HSV');
close;

figure(1);
subplot(1,2,1);
imagesc(img);
title('Original Image');
axis tight;

% Converts Hue channel which are doubles that range from 0 to 1 into integer numbers that range from 1 to 256
figure(2);
imhist(round(imghsv(:,:,1)*255)+1, cmap);
title('Circular Image Histogram');
hst = imhist(round(imghsv(:,:,1)*255)+1, cmap);
otsuthresh(hst)*255
threshold1 = otsuthresh(hst)
hold on;
axis tight;
line(otsuthresh(hst)*255*[1,1], ylim, 'Color', 'r');

imghsv_hue_shifted = mod(0.5+imghsv(:,:,1), 1);
figure(3);
imhist(round(imghsv_hue_shifted(:,:,1)*255)+1, [cmap(128:end,:);cmap(1:127,:)]);
title('Non-circular Image Histogram');
hst = imhist(round(imghsv_hue_shifted(:,:,1)*255)+1, [cmap(128:end,:);cmap(1:127,:)]);
otsuthresh(hst)*255
threshold2 = otsuthresh(hst) + 0.5
hold on;
axis tight;
line(otsuthresh(hst)*255*[1,1], ylim, 'Color', 'r');
% Now we do not have the issue of a dense portion of the circular histogram
% being split across the highest and lowest values. So standard non-circular
% histogram thresholding algorithms can work.

background_mask = (imghsv(:,:,1) >= threshold1) & (imghsv(:,:,1) < threshold2);
foreground_mask = ~background_mask;

figure(1);
ax = subplot(1,2,2);
imagesc(foreground_mask);
title('Thresholding');
colormap(ax, gray);
axis tight;