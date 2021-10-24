load fisheriris;
D = meas;   % [150 x 4] data feature matrix containing 4 features of 150 samples 
[eigvects,D_pca,eigvals] = pca(D);
eigvects
eigvals
D_pca_x = D_pca(:,1);
D_pca_y = D_pca(:,2);
plot(D_pca_x,D_pca_y,'*');
hold on;
theta = 2*pi*[0:100]/100;
ellipse_x = 2*sqrt(eigvals(1))*cos(theta);
ellipse_y = 2*sqrt(eigvals(2))*sin(theta);
plot(ellipse_x, ellipse_y, 'k--');
axis equal;