% maximum likelihood testing program 
% This file should read files one for training, and one for test
% It should arrange the file data so that 1st column is the class 
% rest of the columns are feature vector
% it should also order the data according to class number
close all;
clear;

%modify next two lines based on data sets
% number of class
c = 3;

% read data, 1st column is the class
x = dlmread('iris_training.txt');
y = dlmread('iris_test.txt');

tic
%number of features, first column is class!
n = size(x,2) - 1;

%number of samples in each class
m = no_of_samples(x) ;

% mean vectors for each class
% rows = class, col=feature mean
u = zeros(c,n);

%covariance matrix for all the classes
% last indices is for class number
sigma = cell(c,1);

%calculate mean vectors and covariace for each class
for i=1:c
    startID = 1+sum(m(1:i-1,2));
    endID = sum(m(1:i,2));
    u(i,:) = mean(x(startID:endID , 2:end));
    sigma{i} = cov(x(startID:endID , 2:end));
end   

%number of test samples
k = size(y,1);
% vector to store likelihood fn for each class
f = zeros(1,c);
%scalar to hold number of correct classification
h = 0;

%fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
%loop through each test sample
for i=1:k
    % loop through gaussian distribution for each class 
    for j=1:c
        f(j) = gaussian_mult(y(i, 2:end), u(j,:), sigma{j});
    end
    [~, I] = max(f);
    if (y(i) == I) % if they are correct
        h = h+1;
       % fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I);
    else
       % fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I);
    end    
   
end    
p = h/k*100;

fprintf('The performance of Maximum Likelihood classifier on iris data set is %.2f\n',p);
T=toc


    

