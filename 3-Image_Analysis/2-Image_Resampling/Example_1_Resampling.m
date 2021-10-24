img = imread('cameraman.tif');
figure('Name','Original','NumberTitle','off');
imagesc(img);
colormap(gray);

nr = 1000;
nc = 1500;
[r,c] = size(img);
[C,R] = meshgrid(1:(c-1)/(nc-1):c, 1:(r-1)/(nr-1):r);
upsimg = interp2(double(img), C, R, 'linear');
figure('Name','Upsampled','NumberTitle','off');
imagesc(upsimg);
colormap(gray);

face = img(40:85,90:135);
nr = 10;
nc = 10;
[r,c] = size(face);
[C,R] = meshgrid(1:(c-1)/(nc-1):c, 1:(r-1)/(nr-1):r);
downface = interp2(double(face), C, R, 'linear');
[C,R] = meshgrid(1:(nc-1)/(c-1):nc, 1:(nr-1)/(r-1):nr);
anonface = interp2(double(downface), C, R, 'linear');
img(40:85,90:135) = anonface;
figure('Name','Pixelated Face','NumberTitle','off');
imagesc(img);
colormap(gray);