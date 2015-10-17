% maximum likelihood testing program 
% This file should read files one for training, and one for test
% It should arrange the file data so that 1st column is the class 
% rest of the columns are feature vector
% it should also order the data according to class number

%modify next two lines based on data sets
% number of class
c = 3;

% read data, 1st column is the class
x = dlmread('iris_training.txt');
y = dlmread('iris_test.txt');

p = ml_classifier(c, x, y);

fprintf('The performance of Maximum Likelihood classifier on iris data set is %.2f\n',p);


    

