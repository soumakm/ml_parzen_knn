% maximum likelihood estimation classifier 
% it assumes that class number in first column
% and data is organized by class
% input:
%    c = number of classes(categories)
%    x = training data in matrix
%    y = test data in matrix
% output
%    p = percentage of correct classification, performance

function p = ml_classifier(c, x, y)

%number of features, first column is class!
n = size(x,2) - 1;

%number of samples in each class
m = size(x,1)/c ;

% mean vectors for each class
% rows = class, col=feature mean
u = zeros(c,n);

%covariance matrix for all the classes
% last indices is for class numer
sigma = zeros(n, n, c);

%calculate mean vectors and covariace for each class
for i=1:c
    u(i,:) = mean(x(1+(i-1)*m:i*m , 2:end));
    sigma(:,:,i) = cov(x(1+(i-1)*m:i*m , 2:end));
end    

%number of test samples
k = size(y,1);
% vector to store likelihood fn for each class
f = zeros(1,c);
%scalar to hold number of correct classification
h = 0;

fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
%loop through each test sample
for i=1:k
    % loop through gaussian distribution for each class 
    for j=1:c
        f(j) = gaussian_mult(y(i, 2:end), u(j,:), sigma(:,:,j));
    end
    [~, I] = max(f);
    if (y(i) == I) % if they are correct
        h = h+1;
        fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I);
    else
        fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I);
    end    
   
end    
p = h/k*100;
end
