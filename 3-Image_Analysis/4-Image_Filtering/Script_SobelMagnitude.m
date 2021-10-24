img = imread('cameraman.tif');

edge_mag = SobelMagnitude(img);

ax1 = subplot(1,2,1);
imagesc(img);
colormap(ax1, gray);

ax2 = subplot(1,2,2);
imagesc(edge_mag);
colormap(ax2, gray);