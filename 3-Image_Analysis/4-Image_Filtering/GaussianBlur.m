function [img_filt,filt] = GaussianBlur(img,sigma)
    % Use fspecial to generate the Gaussian filter
    w = round(6*sigma);
    filt = fspecial('gaussian', [w,w], sigma);
    
    % Apply the filter to the image using convolution
    img_filt = conv2(img, filt, 'same');
end