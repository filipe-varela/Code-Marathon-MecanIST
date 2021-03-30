function [K] = build_edge_kernel(alpha, dimension)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

K1 = zeros(dimension);
K2 = zeros(dimension);
K3 = zeros(dimension);
k = 1;

middle_x = round(dimension / 2);
middle_y = round(dimension / 2);

for x = 1:dimension
    if x == 1
        k = 1;
    else
        k = k*(-alpha+(x-2));
    end
    elemento = k/factorial(x-1);
    
    K1(x,middle_y) = elemento;
    K2(middle_x,x) = elemento;
    K3(x,x) = elemento;
    
end

K = K1 + K2 + K3 + flipud(K1+K3) + fliplr(K2+K3+flipud(K3));
M = sum(sum(K));
if M == 0
    M = 1;
else
    K = K / M;
end
end
