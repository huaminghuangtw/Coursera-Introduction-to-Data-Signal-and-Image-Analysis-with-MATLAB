load fisheriris;
D = meas;   % [150 x 4] data feature matrix containing 4 features of 150 samples 

% Compute D_pca and eigvals using the pca function
[~,D_pca,eigvals] = pca(D);

% Define D_pca_x and D_pca_y, the first two dimensions of the data in the D_pca feature space
D_pca_x = D_pca(:,1);
D_pca_y = D_pca(:,2);

% Scatter plot the data with asterisks '*'
plot(D_pca_x, D_pca_y, '*');

% Define ellipse_x and ellipse_y, x and y coordinates for the PCA ellipsoid in the first 2 dimensions as a function of theta 
theta = 2*pi*[0:100]/100;
ellipse_x = 2*sqrt(eigvals(1))*cos(theta);
ellipse_y = 2*sqrt(eigvals(2))*sin(theta);

% Plot the ellipse with red dashed lines 'r--'
hold on;
plot(ellipse_x, ellipse_y, 'r--');

% Use axis equal to correct aspect ratio
axis equal;