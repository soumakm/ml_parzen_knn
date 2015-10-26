% knn testing program for handwriting data set
% This file should read files one for training, and one for test
% It should arrange the file data so that test vector should only have feature 
% it should also provide the training data in the form of a matrix
% where rows represent number of samples, column represents features with
% first column is class number

close all;
clear;
clc;

% read data, 1st column is the class
x = dlmread('handwriting_train.txt');

% number of rows in test data
m = size(x,1);

for k=1:1:10
% declare a scalar to count the correct classification
    count = 0;

    %fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
    % loop through each test data sample
    for i=1:m
z = x;
        y = x(i,2:end);
        z(i,:) = [];
        I = knn(y, z, k); % y should be stiped of class number (col1)
        if (x(i,1) == I) % if they are correct
            count = count+1;
           %   fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I);
        else
         %   fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I);
        end 
    end    

    fprintf('The performance of KNN classifier for k=%d on handwriting data set is %.2f\n',k,count/m*100);
end
