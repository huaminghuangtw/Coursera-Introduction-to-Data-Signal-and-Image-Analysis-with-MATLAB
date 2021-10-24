[C,R] = meshgrid(1:10,1:15); % inputs are ordered columns, then rows
img = uint8(C.*R);
size(img) % = 15 x 10
dim = [20;25];
img_resample = ImageResample(img, dim);
size(img_resample) % = 20 x 25
imagesc(img);
figure;
imagesc(img_resample);