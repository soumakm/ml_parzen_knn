% This function calculates the density function by Parzen window method
% input :
%     x = test data vector, 1xd
%     y = training data matrix of a class, nxd
%     h = window width
% output:
%     p = probability density of the class

function p = parzen_window(x, y, h)

% feature vector dimention
    d = size(x,2);
% number of rows in training data    
    n = size(y,1);
% declare return value p as scalar
    p = 0;
% calculate sum of window function for each test vector    
    for i=1:n
        p = p + 1/(sqrt(2*pi)*(h^d))*(exp(-0.5*(norm(x-y(i, :))/h)^2));%exclude n to take into account prior prob
    end    
end