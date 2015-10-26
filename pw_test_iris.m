% parzen window testing program for iris data set
% This file should read files one for training, and one for test
% It should arrange the file data so that test vector should only have feature 
% it should also provide the training data in the form of a matrix
% where rows represent number of samples, column represents features
close all;
clear;

%modify next two lines based on data sets
% number of class, classes are numbered 1, 2, 3
c = 3;
% set window size, h=0.5
h = 0.5;

% read data, 1st column is the class
x = dlmread('iris_training.txt');

% read test data which are to be classified
y = dlmread('iris_test.txt');
tic
%size of training data
m = size(x,1);
%arrange training data so that each class has its own matrix
a=1;
b=1;
e=1;
for i=1:m
    if (x(i) == 1)
        x1(a,:) = x(i, 2:end);
        a = a+1;
    end  
    
    if (x(i) == 2)
        x2(b,:) = x(i, 2:end);
        b = b+1;
    end 
    
    if (x(i) == 3)
        x3(e,:) = x(i, 2:end);
        e = e+1;
    end 
end

% number of rows in test data
n = size(y,1);
% allocate a vector to hold probability density of each class
p = zeros(1,c);
% declare a scalar to count the correct classification
count = 0;

%fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
% loop through each test data sample
for i=1:n
    
        p(1) = parzen_window(y(i,2:end), x1, h);
        p(2) = parzen_window(y(i,2:end), x2, h);
        p(3) = parzen_window(y(i,2:end), x3, h);
     
    
    [~, I] = max(p);
    if (y(i) == I) % if they are correct
        count = count+1;
       % fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I);
    else
       % fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I);
    end 
end    
 
fprintf('The performance of Parzen window classifier on iris data set is %.2f\n',count/n*100);

T=toc