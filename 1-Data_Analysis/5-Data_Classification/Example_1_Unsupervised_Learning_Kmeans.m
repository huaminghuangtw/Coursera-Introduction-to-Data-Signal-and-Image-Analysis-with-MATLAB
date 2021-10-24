load fisheriris;
[~,~,s] = unique(species);
[~,D_pca] = pca(meas);

figure(1);
plot(D_pca(s==1,1), D_pca(s==1,2), 'rx');
hold on;
plot(D_pca(s==2,1), D_pca(s==2,2), 'go');
plot(D_pca(s==3,1), D_pca(s==3,2), 'b*');
xlabel('PCA Feature 1');
ylabel('PCA Feature 2');
axis equal;

[X,Y] = meshgrid([-4:0.01:4],[-2:0.01:2]);

% ------------------------------------------------------------------

rng(0); [cls,C] = kmeans(D_pca(:,1:2), 3);
plot(C(:,1), C(:,2), 'ko', 'LineWidth', 3);

dist1 = sqrt((C(1,1)-X).^2 + (C(1,2)-Y).^2);
dist2 = sqrt((C(2,1)-X).^2 + (C(2,2)-Y).^2);
dist3 = sqrt((C(3,1)-X).^2 + (C(3,2)-Y).^2);
cls3 = (dist3 < dist1) & (dist3 < dist2);
cls2 = ~cls3 & (dist2 < dist1);
cls1 = ~cls3 & ~cls2;
contour(X, Y, cls1, [1 1], 'k--');
contour(X, Y, cls2, [1 1], 'k--');
contour(X, Y, cls3, [1 1], 'k--');
[cls s]
accuracy = sum((4-cls) == s) / length(s) * 100

% ------------------------------------------------------------------

C = [mean(D_pca(s==1,:)); mean(D_pca(s==2,:)); mean(D_pca(s==3,:))];
plot(C(:,1), C(:,2), 'mo', 'LineWidth', 3);

dist1 = sqrt((C(1,1)-D_pca(:,1)).^2 + (C(1,2)-D_pca(:,2)).^2);
dist2 = sqrt((C(2,1)-D_pca(:,1)).^2 + (C(2,2)-D_pca(:,2)).^2);
dist3 = sqrt((C(3,1)-D_pca(:,1)).^2 + (C(3,2)-D_pca(:,2)).^2);
cls3 = (dist3 < dist1) & (dist3 < dist2);
cls2 = ~cls3 & (dist2 < dist1);
cls1 = ~cls3 & ~cls2;
cls = 3*cls3 + 2*cls2 + 1*cls1;
accuracy = sum(cls == s) / length(s) * 100