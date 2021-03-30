function [K] = build_gaussian_kernel(sigma, dimension)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

K = zeros(dimension);
middle_x = round(dimension / 2);
middle_y = round(dimension / 2);


for x = 1:dimension
    for y = 1:dimension
        elemento = exp(-((x-middle_x)^2+(y-middle_y)^2)/(2*(sigma^2)));
        K(x,y) = elemento;
        M = sum(sum(K));
    end
end

if M == 0
    M = 1;
else
    K = K / M;

end