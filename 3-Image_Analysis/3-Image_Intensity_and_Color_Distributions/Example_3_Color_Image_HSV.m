img = imread('peppers.png');
imghsv = rgb2hsv(img);

size(imghsv)

subplot(3,2,1);
imagesc(imghsv(:,:,1));
axis tight; axis equal;
cmap = hsv2rgb([[0:1/255:1]', ones(256,2)]);
colormap(gca, cmap);
title('Hue Channel');

subplot(3,2,2);
imhist(round(imghsv(:,:,1)*255)+1, cmap);
axis tight;

ax3 = subplot(3,2,3);
imagesc(imghsv(:,:,2));
colormap(ax3, gray);
axis tight; axis equal;
title('Saturation Channel');

subplot(3,2,4);
imhist(imghsv(:,:,2));
axis tight;

ax5 = subplot(3,2,5);
imagesc(imghsv(:,:,3));
colormap(ax5, gray);
axis tight; axis equal;
title('Value Channel');

subplot(3,2,6);
imhist(imghsv(:,:,3));
axis tight;