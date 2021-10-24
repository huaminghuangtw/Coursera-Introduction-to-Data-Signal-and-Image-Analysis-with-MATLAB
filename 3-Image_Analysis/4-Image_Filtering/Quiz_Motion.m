img = imread('cameraman.tif');
motion_filter = fspecial('motion');
img_motion_filter = conv2(img, motion_filter, 'same');
meanIntensityValue = mean2(img_motion_filter)

% Answer
% 117.53