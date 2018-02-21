function [estVecLinComb] = orthoProj(vector,array)
%so before we do any operations between the vector to be estimated and an
%array of orthonormal columns, we have to make the vector the same size as
%the matrix; only want to take the norm of each column, working column by
%column and only want to do it once so use vecnorm()
a = repmat(vector, 1, size(array,2));
j = sum(conj(array).*a);
b = repmat(j, size(array,1), 1);
estVecLinComb = sum(b.*array, 2);
end

