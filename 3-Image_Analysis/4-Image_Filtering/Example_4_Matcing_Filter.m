img = imread('text.png');

subplot(1,2,1);
rng(0);
img = img + 0.05*randn(size(img)); % add random white noise artifacts
imagesc(img);
colormap(gray);
axis tight; axis equal;

subplot(1,2,2);
match_h = img(33:45,88:99); % matching filter
match_v = flipud(match_h');
imagesc(match_h);
axis tight; axis equal;

subplot(1,2,1);
%%
img_match_h = zeros(size(img));
[r,c] = size(match_h);
dr = floor(r/2);
dc = floor(c/2);
for i = 1 : (size(img,1) - r + 1)
    for j = 1 : (size(img,2) - c + 1)
        img_match_h(i+dr,j+dc) = corr(match_h(:), reshape(img(i:i+r-1,j:j+c-1), [r*c,1])); % ranges from 0 to 1
    end
end
%%
img_match_v = zeros(size(img));
[r,c] = size(match_v);
dr = floor(r/2);
dc = floor(c/2);
for i = 1 : (size(img,1) - r + 1)
    for j = 1 : (size(img,2) - c + 1)
        img_match_v(i+dr,j+dc) = corr(match_v(:), reshape(img(i:i+r-1,j:j+c-1), [r*c,1]));
    end
end
axis tight; axis equal;
%%
[boxr,boxc] = find(img_match_h > 0.75);
DrawBoxes(boxr, boxc, 'r');
[boxr,boxc] = find(img_match_v > 0.75);
DrawBoxes(boxr, boxc, 'g');