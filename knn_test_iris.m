% knn testing program for iris data set
% This file should read files one for training, and one for test
% It should arrange the file data so that test vector should only have feature 
% it should also provide the training data in the form of a matrix
% where rows represent number of samples, column represents features with
% first column is class number

close all;
clear;

% set k, best k=3, k=6
k = 3;

% read data, 1st column is the class
x = dlmread('iris_training.txt');

% read test data which are to be classified
y = dlmread('iris_test.txt');
tic
% number of rows in test data
n = size(y,1);

% declare a scalar to count the correct classification
count = 0;

%fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
% loop through each test data sample
for i=1:n
        
    I = knn(y(i,2:end), x, k); % y should be stiped of class number (col1)
    if (y(i) == I) % if they are correct
        count = count+1;
      %  fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I);
    else
      %  fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I);
    end 
end    
 
fprintf('The performance of KNN classifier on iris data set is %.2f\n',count/n*100);

T=toc