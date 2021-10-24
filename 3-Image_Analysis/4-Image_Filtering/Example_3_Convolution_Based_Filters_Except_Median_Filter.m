img = imread('moon.tif');

filt_sobelh = fspecial('sobel'); % Horizontal Sobel operator
filt_sobelv = filt_sobelh';      % Vertical Sobel operator
filt_log = fspecial('log');      % Laplacian of Gaussian filter

%% Original image
ax1 = subplot(2,6,1);
image(img);
colormap(ax1, gray);
title('moon.tif');
axis tight; axis equal;

ax7 = subplot(2,6,7);
image(img);
axis([130,250,360,480]);
colormap(ax7, gray);

%% Horizontal Sobel operator
ax2 = subplot(2,6,2);
img_sobelh = conv2(img, filt_sobelh, 'same');
image(abs(img_sobelh)); % we take the absolute value so that we get the magnitude for both bright to dark, and dark to bright horizontal edges
colormap(ax2, gray);
title('Horizontal Sobel');
axis tight; axis equal;

ax8 = subplot(2,6,8);
image(abs(img_sobelh));
axis([130,250,360,480]);
colormap(ax8, gray);

%% Vertical Sobel operator
ax3 = subplot(2,6,3);
img_sobelv = conv2(img, filt_sobelv, 'same');
image(abs(img_sobelv));
colormap(ax3, gray);
title('Vertical Sobel');
axis tight; axis equal;

ax9 = subplot(2,6,9);
image(abs(img_sobelv));
axis([130,250,360,480]);
colormap(ax9, gray);

%% Add quiver plots
subplot(2,6,7);
hold on;
quiver(img_sobelv, img_sobelh, 'LineWidth', 2); % display gradient vectors

%% Laplacian fo Gaussian filter
ax4 = subplot(2,6,4);
img_log = conv2(img, filt_log, 'same');
imagesc(img_log);
colormap(ax4, gray);
title('Laplacian of Gaussian');
axis tight; axis equal;

ax10 = subplot(2,6,10);
imagesc(img_log);
axis([130,250,360,480]);
colormap(ax10, gray);

%% Sharpen image
ax5 = subplot(2,6,5);
img_sharpened = double(img) - 1*img_log;
%{
    Since the filter result is positive on the dark side of an edge and negative on the bright side of an edge,
    adding a negative fraction of the filter will make the dark side of the edges darker and
    the bright side of the edges brighter, thus sharpening the image.
%}
image(img_sharpened);
colormap(ax5, gray);
title('Sharpened image');
axis tight; axis equal;

ax11 = subplot(2,6,11);
image(img_sharpened);
axis([130,250,360,480]);
colormap(ax11, gray);

%% Median blur
ax6 = subplot(2,6,6);
img_med = img;
for i = 2 : (size(img,1) - 1)
    for j = 2 : (size(img,2) - 1)
        img_med(i,j) = median(img(i-1:i+1,j-1:j+1),'all');
        % The second argument 'all' tells the median function to consider all the values in the matrix,
        % rather than computing the median of each column of the matrix separately.
    end
end
image(img_med); % with this non-linear filter, we get good noise suppression without losing too much fine detail in the image
colormap(ax6, gray);
title('Median filtered image');
axis tight; axis equal;

ax12 = subplot(2,6,12);
image(img_med);
axis([130,250,360,480]);
colormap(ax12, gray);