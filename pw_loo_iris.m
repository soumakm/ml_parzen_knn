% parzen window testing program for iris data set
% This file should read files one for training, and one for test
% It should arrange the file data so that test vector should only have feature 
% it should also provide the training data in the form of a matrix
% where rows represent number of samples, column represents features
close all;
clear;
clc;

%modify next two lines based on data sets
% number of class, classes are numbered 1, 2, 3
c = 3;

% read data, 1st column is the class
x = dlmread('iris_training.txt');

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

% allocate a vector to hold probability density of each class
p = zeros(1,c);
% declare a scalar to count the correct classification
count = 0;

%fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
% loop through each test data sample
for h=0.2:0.1:1.0
    count = 0;
a=1;
b=1;
e=1;
    for i=1:m
            z1 = x1;
            z2 = x2;
            z3 = x3;

            if(x(i) == 1)
                z1(a,:) = [];
                a = a+1;
            elseif (x(i) == 2)
                z2(b,:) = [];
                b = b+1;
            elseif (x(i) == 3)
                z3(e,:) = [];
                e = e + 1;
            end    

            p(1) = parzen_window(x(i,2:end), z1, h);
            p(2) = parzen_window(x(i,2:end), z2, h);
            p(3) = parzen_window(x(i,2:end), z3, h);

        [~, I] = max(p);
        if (x(i) == I) % if they are correct
            count = count+1;
           % fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I);
        else
           % fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I);
        end 
    end  
    fprintf('The performance of Parzen window classifier for h = %.2f on iris data set is %.2f\n',h,count/m*100);
end 


