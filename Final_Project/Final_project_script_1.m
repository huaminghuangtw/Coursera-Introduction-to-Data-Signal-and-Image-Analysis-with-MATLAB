% Define the filter size we will use in step 2
filtsize = 85;

% Creating test image 'im' by splicing together two built-in images ('coins.png' and 'eight.tif').
% Also zero-padding (adding zeros around the border) with half the filter size (filtsize) we will use
% so that the filter could be centered on any actual image pixel, including those near the border
% 'coins.png' contains bright nickels and dimes on a dark background
% 'eight.tif' contains dark quarters on a bright background, so we invert it to match 'coins.png'
im1 = imread('coins.png');
[r1,c1] = size(im1);
im2 = imread('eight.tif');
[r2,c2] = size(im2);
filtsizeh = floor(filtsize/2);
im = zeros(r1+r2+filtsize, c1+filtsize);
im(filtsizeh+1:filtsizeh+r1+r2, filtsizeh+1:filtsizeh+c1) = [im1; 255-im2(:,1:c1)];
[r,c] = size(im);
imagesc(im); colormap(gray); title('test image'); axis equal;

% Initialize assessed/displayed variables as empty so that code is executable 
msk=[]; msk_dil=[]; msk_dil_erd=[]; centroid=[]; component_size=[]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Step 1. Localize the centroid of each coin %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Otsu threshold
[msk,~] = OtsuThreshold(im);

figure; imagesc(msk); colormap(gray); title("Otsu's Threshold"); axis equal;

% Dilate 
structuring_element = ones(9,9);
msk_dil = imdilate(msk, structuring_element);

figure; imagesc(msk_dil); colormap(gray); title('Dilated'); axis equal;

% Erode 
structuring_element = ones(23,23);
msk_dil_erd = imerode(msk_dil, structuring_element);

figure; imagesc(msk_dil_erd); colormap(gray); title('Eroded'); axis equal;

% Connected components to get centroids of coins
cconnected_comps = bwconncomp(msk_dil_erd);
props_struct = regionprops(connected_comps);
N = connected_comps.NumObjects
centroid = zeros(N,2);
component_size = zeros(N,1);
for i = 1 : N
    %centroid(i,1) = round(props_struct(i).Centroid(1));
    %centroid(i,2) = round(props_struct(i).Centroid(2));
    centroid(i,:) = round(props_struct(i).Centroid);
    component_size(i) = props_struct(i).Area;
end

centroid
component_size

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Helper Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [msk,thrsh] = OtsuThreshold(img)
    % Define the Otsu threshold 'thrsh' using the histogram of img
    hst = imhist(img);
    thrsh = otsuthresh(hst)*255;

    % Apply the threshold to 'img' to make 'msk'
    msk = (img > thrsh);
end