img = imread('peppers.png');
imghsv = rgb2hsv(img);

subplot(2,2,1);
imagesc(img);

subplot(2,2,2);
hsvbright = imghsv;
hsvbright(:,:,3) = hsvbright(:,:,3).^0.5;
imagesc(hsv2rgb(hsvbright));
title('Intensity brightened image');

subplot(2,2,3);
hsvsat = imghsv;
hsvsat(:,:,2) = hsvsat(:,:,2).^0.5;
imagesc(hsv2rgb(hsvsat));
title('Color saturated image');

subplot(2,2,4);
hsvhue = imghsv;
hsvhue(:,:,1) = mod(hsvhue(:,:,1)-0.1, 1);
imagesc(hsv2rgb(hsvhue));
title('Hue shifted image');