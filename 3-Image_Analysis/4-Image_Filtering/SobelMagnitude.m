function edge_mag = SobelMagnitude(img)
    % Use fspecial to generate the horizontal and vertical Sobel filters (sh and sv)
    sh = fspecial('sobel');
    sv = sh';

    % Apply both filters to the image to generate img_sh and img_sv
    img_sh = conv2(img, sh, 'same');
    img_sv = conv2(img, sv, 'same');

    % Compute edge_mag as the square root of the sum of the squared img_sh and img_sv results
    edge_mag = sqrt(img_sh.*img_sh + img_sv.*img_sv);
end