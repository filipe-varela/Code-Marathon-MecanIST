function [image_output] = toning_image(R, G, B, a,b,c,d,e,f, matrix_input, alpha, beta)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
A = matrix_input;
D = matrix_input;
C = matrix_input;

C(:,:,1) = R*C(:,:,1);
D(:,:,1) = R*D(:,:,1);
C(:,:,2) = G*C(:,:,2);
D(:,:,2) = G*D(:,:,2);
C(:,:,3) = B*C(:,:,3);
D(:,:,3) = B*D(:,:,3);
    
    
D(:,:,1) = round(alpha*D(:,:,1) + beta*R);
D(:,:,2) = round(alpha*D(:,:,2) + beta*G);
D(:,:,3) = round(alpha*D(:,:,3) + beta*B);
    
for j = 1:length(A(1,:,1))
    for i = 1:length(A(:,1,1))
        if A(i,j,1) < a || A(i,j, 1) > b
            C(i,j,1) = 0;
            D(i,j,1) = 0;
        end
        if A(i,j,2) < c || A(i,j, 2) > d
            C(i,j,2) = 0;
            D(i,j,2) = 0;
        end
        if A(i,j,3) < e || A(i,j, 3) > f
            C(i,j,3) = 0;
            D(i,j,3) = 0;
        end
    end
end
        

    
    

image_output = A - C + D;

end

