function [boolean] = isOrthonormal(array)
%we know that if we have a 2D array and want to figure out if two columns
%are orthonormal we can multiply the matrix by its conjugate transpose
%and if the result of this matrix multiplication is not the identity matrix
%then all of the columns are not orthonormal; only want the row vector so
%we do size(array,1), vecnorm takes the norm of each column of 
%the whole result matrix after subtraction, then take the norm of the row 
%vector that gets created; thank you kevin lin for showing me vecnorm
boolean = norm(vecnorm(array*array' - eye(size(array,1)))) < 1000*eps
end

