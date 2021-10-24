D = [1 3 2 4; 1 3 4 5]';
class = [0; 0; 1; 1];
mdl = myfitpca(D,class);
mdl.class(1) % eigvects: [0.7071 0.7071]; eigvals: 4; mu: [2 2];
mdl.class(2) % eigvects: [0.8944 0.4472]; eigvals: 2.5000; mu: [3 4.5000];

D = [1 3 2 4 5; 1 3 4 5 6; 6 3 2 1 7]';
class = [0; 0; 1; 1; 2];
mdl = myfitpca(D,class);
mdl.class(1) % eigvects: [-0.4851 -0.4851 0.7276]; eigvals: 8.5000; mu: [2 2 4.5000]
mdl.class(2) % eigvects: [0.8165 0.4082 -0.4082]; eigvals: 3.0000; mu: [3 4.5000 1.5000]
mdl.class(3) % eigvects: [0×3 double]; eigvals: [0×1 double]; mu: [5 6 7] (We get empty eigvects and eigvals because with only one datapoint, there is no variability from the mean!)
