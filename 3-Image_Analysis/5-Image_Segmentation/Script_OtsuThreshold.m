img = imread('mri.tif');
[msk,thrsh] = OtsuThreshold(img);

subplot(1,2,1);
imagesc(img);
title('mri');
colormap(gray);

subplot(1,2,2);
imagesc(msk);
title("Otsu's Thresholding");
colormap(gray);
thrsh % = 36