img = imread('cameraman.tif');   % requires Image Processing Toolbox
imagesc(img);
colormap(gray);
axis equal;
img(40:75,100:135) = 127;
imagesc(img);
axis equal;
imwrite(img, 'cameraman_anonymized.jpeg');