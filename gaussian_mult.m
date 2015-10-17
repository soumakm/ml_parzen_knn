% Multivariate gaussian function
% input:
%   x = row vector of 1xd , data
%   u = row vector of 1xd , mean
%   sigma = dxd matrix, covariance
% output:
%   y = return gaussian density

function y = gaussian_mult(x, u, sigma)
    d = size(x,2);
    y = 1/sqrt(det(sigma)*(2*pi)^d)*exp(-0.5*(x-u)/sigma*(x-u)');
end