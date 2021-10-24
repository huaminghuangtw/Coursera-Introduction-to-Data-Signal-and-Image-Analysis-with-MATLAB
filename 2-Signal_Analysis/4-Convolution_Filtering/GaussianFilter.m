function y = GaussianFilter(x, sigma)
    % Compute W by rounding up 6*sigma
    W = ceil(6*sigma);

    % Use fspecial to create our Gaussian filter
    gaussianfilter = fspecial('gaussian',[1,W],sigma);

    % Convolve the signal with the filter
    y = conv(x,gaussianfilter,'same');
end