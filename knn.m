% This function calculates knn algorithm and returns
% the class number that occurs most in k nearest neighbots
% input:
%       x: input test data in vector, 1xd
%       y: labeled training matrix where 1st column is class number, nxd
%       k: the number of neighbor it should look for, scalar
% output;
%       c: class number which most of x's neighbors belong to!

function c = knn(x, y, k)

%number of training samples
n=size(y,1);
%matrix to hold class number and euclidian distance from test sample x
z=zeros(n,2);

for i=1:n
    z(i,1) = y(i,1);
    z(i,2) = norm(y(i,2:end) - x);
end    

%sort z according to distance (2nd column) ascending order
z = sortrows(z,2);

% create a class vector for k-nn
v = zeros(1,k);
for i=1:k
    v(i) = z(i,1);
end    

%find the maximum occurence of a class number
c = mode(v);




