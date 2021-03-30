function [K] = build_sharp_kernel(alpha, dimension)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
K1 = zeros(dimension);
K1(round(dimension/2),round(dimension/2)) = 1;
K = build_edge_kernel(alpha, dimension);

M = sum(sum(K));

if M == 0
    M = 1;
else
    K = K / M;
end

K = K1/M + K;

end