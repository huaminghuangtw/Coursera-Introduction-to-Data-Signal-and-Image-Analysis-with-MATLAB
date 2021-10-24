function [msk,thrsh] = OtsuThreshold(img)
    % Define the Otsu threshold 'thrsh' using the histogram of img
    hst = imhist(img);
    thrsh = otsuthresh(hst)*255;

    % Apply the threshold to 'img' to make 'msk'
    msk = (img > thrsh);
end