% parzen window testing program 
% This file should read files one for training, and one for test
% It should arrange the file data so that test vector should only have feature 
% it should also provide the training data in the form of a matrix
% where rows represent number of samples, column represents features
close all;
clear;

%modify next two lines based on data sets
% number of class, classes are numbered 1, 2, 3
c = 10;
% set window size, best h=2.0
h = 1.0;

% read data, 1st column is the class
x = dlmread('handwriting_train.txt');
y = dlmread('handwriting_test.txt');
tic

%size of training data
m = size(x,1);
%arrange training data so that each class has its own matrix
a0=1;
a1=1;
a2=1;
a3=1;
a4=1;
a5=1;
a6=1;
a7=1;
a8=1;
a9=1;

% There are 3 classes for wine data set
for i=1:m
    if (x(i) == 0)
        x0(a0,:) = x(i, 2:end);
        a0 = a0+1;
    end 
    
    if (x(i) == 1)
        x1(a1,:) = x(i, 2:end);
        a1 = a1+1;
    end  
    
    if (x(i) == 2)
        x2(a2,:) = x(i, 2:end);
        a2 = a2+1;
    end 
    
    if (x(i) == 3)
        x3(a3,:) = x(i, 2:end);
        a3 = a3+1;
    end 
    
    if (x(i) == 4)
        x4(a4,:) = x(i, 2:end);
        a4 = a4+1;
    end 
    
    if (x(i) == 5)
        x5(a5,:) = x(i, 2:end);
        a5 = a5+1;
    end 
    
    if (x(i) == 6)
        x6(a6,:) = x(i, 2:end);
        a6 = a6+1;
    end 
    
    if (x(i) == 7)
        x7(a7,:) = x(i, 2:end);
        a7 = a7+1;
    end 
    
    if (x(i) == 8)
        x8(a8,:) = x(i, 2:end);
        a8 = a8+1;
    end 
    
    if (x(i) == 9)
        x9(a9,:) = x(i, 2:end);
        a9 = a9+1;
    end 
end

% number of rows in test data
n = size(y,1);
% allocate a vector to hold probability density of each class
p = zeros(1,c);
% declare a scalar to count the correct classification
count = 0;

%fprintf('Sample No.  Actual Class  Classified Class  Corrrect?\n');
% loop through each test data sample, 1st column is class number, col=2:end
% represent feature
for i=1:n
        p(1) = parzen_window(y(i,2:end), x0, h);
        p(2) = parzen_window(y(i,2:end), x1, h);
        p(3) = parzen_window(y(i,2:end), x2, h);
        p(4) = parzen_window(y(i,2:end), x3, h);
        p(5) = parzen_window(y(i,2:end), x4, h);
        p(6) = parzen_window(y(i,2:end), x5, h);
        p(7) = parzen_window(y(i,2:end), x6, h);
        p(8) = parzen_window(y(i,2:end), x7, h);
        p(9) = parzen_window(y(i,2:end), x8, h);
        p(10) = parzen_window(y(i,2:end), x9, h);
    [~, I] = max(p);
    if (y(i) == (I-1)) % if they are correct
        count = count+1;
    %    fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t yes\n', i, y(i), I-1);
    else
    %    fprintf('%d\t\t\t\t %d\t\t\t\t %d\t\t\t\t no\n', i, y(i), I-1);
    end 
end    
 
fprintf('The performance of Parzen window classifier on hand writing data set is %.2f\n',count/n*100);
T=toc
