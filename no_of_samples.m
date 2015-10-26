% This function will return number of samples of each class in a matrix
% input:
%      x: a matrix nxd, 1st column is class number
% output:
%      y: a nx2 matrix where col1=class number, col2=number of samples
function y = no_of_samples(x)

n = size(x,1);
y = ones(n,2);
for i=1:n
    y(i,1)=x(i,1);
end    
[a,~,c] = unique(x(:,1));
y = [a, accumarray(c,y(:,2))];