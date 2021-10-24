function mdl = myfitpca(D,class)
    % Find the number of unique classes from the class vector, numclasses    
    class_labels = unique(class);
    numclasses = length(class_labels);
    % For each class, use 'pca' to find the eigenvectors (1st output),
    % eigenvalues (3rd output), and mean feature vector (6th output),
    % create a subfield 'class' within the output struct mdl, which is a vector of length numclasses
    % mdl.class(i) has subfields 'eigvects' (the eigenvectors matrix output from 'pca', transposed),
    % 'eigvals' (the eigenvalues output from 'pca'), and
    % 'mu' (the mean feature vector)
    for i = 1:numclasses
        [eigvects,~,eigvals,~,~,mu] = pca(D(class == class_labels(i),:));
        mdl.class(i).eigvects = eigvects';
        mdl.class(i).eigvals = eigvals;
        mdl.class(i).mu = mu;
    end
end