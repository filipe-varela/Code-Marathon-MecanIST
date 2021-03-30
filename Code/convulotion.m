function [matrix_output] = convulotion(matrix,kernel)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

kernel_size = length(kernel(:,1));

support_matrix = [matrix matrix matrix; ...
                  matrix matrix matrix; ...
                  matrix matrix matrix];

x_size_matrix = length(matrix(:, 1, 1));
y_size_matrix = length(matrix(1, :, 1));

matrix_output = support_matrix( x_size_matrix+1 : 2*x_size_matrix, ...
                                y_size_matrix+1 : 2*y_size_matrix, :);
                            
for matrix_x = 1:x_size_matrix
    for matrix_y = 1:y_size_matrix
        current_element = support_matrix( ...
            x_size_matrix + matrix_x - (kernel_size-1)/2 : x_size_matrix + matrix_x + (kernel_size-1)/2, ...
            y_size_matrix + matrix_y - (kernel_size-1)/2 : y_size_matrix + matrix_y + (kernel_size-1)/2, ...
            :);
        for matrix_z = 1:3
            accumulator = 0;
            for kernel_x = 1:kernel_size
                for kernel_y = 1:kernel_size
                    accumulator = accumulator + current_element(kernel_x, kernel_y, matrix_z) ... 
                        * kernel(kernel_x, kernel_y);
                end
            end
            matrix_output(matrix_x, matrix_y, matrix_z) = accumulator;
        end
    end
end

end

