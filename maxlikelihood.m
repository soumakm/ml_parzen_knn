% maximum likelihood estimation classifier 
% This will work assuming each class has equal number of samples
% and first column is class name

%modify next two lines based on data sets
% number of class
c = 3;
%number of features
n = 4;

% read data, 1st column is the class
x = dlmread('iris_training.txt');

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

% likelihood classifier on iris test data set
y = dlmread('iris_test.txt');
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

fprintf('The performance of Maximum Likelihood classifier is %f',h/k*100);



    

