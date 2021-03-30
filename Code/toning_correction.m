function [matrix_output] = toning_correction(matrix, limit)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

matrix_output = matrix;
limit_x = length(matrix(:,1,1));
limit_y = length(matrix(1,:,1));

for x = 1:limit_x
    for y = 1:limit_y
        current_element = matrix(x,y,:);
        for z = 1:3
            if (current_element(z) >= limit)
                current_element(z) = 255;
            else
                current_element(z) = 0;
            end
        end
        matrix_output(x,y,:) = current_element;
    end
end

end

