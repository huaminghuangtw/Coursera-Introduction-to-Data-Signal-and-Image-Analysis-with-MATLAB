load RGB.mat;

%img = zeros(256,256,3);
%img(:,:,1) = R;
%img(:,:,2) = G;
%img(:,:,3) = B;
img = cat(3, R, G, B);

figure;
imagesc(img);

% Answer
% Color Images In MATLAB