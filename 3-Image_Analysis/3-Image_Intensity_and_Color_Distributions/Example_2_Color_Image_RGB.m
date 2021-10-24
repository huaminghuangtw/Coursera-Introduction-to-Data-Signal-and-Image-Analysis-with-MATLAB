img = imread('peppers.png');

size(img)

subplot(2,2,1);
imagesc(img);
axis tight;
axis equal;

subplot(2,2,2);
imhist(img(:,:,1));
title('Red Channel');
axis tight;

subplot(2,2,3);
imhist(img(:,:,2));
title('Green Channel');
axis tight;

subplot(2,2,4);
imhist(img(:,:,3));
title('Blue Channel');
axis tight;