%input is a 2D array, each column of which is a vector in the original
%linearly independent set of vectors
function [outputMat] = gramSchmidt(array)
%take the input 2D array and give me the number of rows and columns, so in
%this case our array is the phis
[m,n] = size(array);
%create the output matrix, where our orthonormal set of vectors will be
%stored, make everything zero so we can replace the columns of zeros with
%the orthonormal set of vectors in the outputMat
outputMat = zeros(m,n);
%since we acquire the first vector, or our first psi, in our new orthonormal set of vectors by
%just doing the first signal over the norm of the first signal, i.e. we
%dont have any of the extra inner products like with later psi's, we can
%just replace the first column of the outputMat with the first linearly
%independent vector, located in column 1, in array, over the first linearly
%independent vector's norm
outputMat(:,1) = array(:,1)/norm(array(:,1));
%now we are probably gonna have more than just one linearly independent
%vector in our array, so we want to be able to go through all the rest of
%the b linearly independent vectors (from 2 to b) and create psi 2 through
%n, but this time its not as easy as just the signal over its norm, we need
%to do like psi_n = s_n - [<s_n,phi_1>phi_1 + <s_n, phi_2>phi_2 +...+
%,<s_n,phi_(n-1)>phi_(n-1)]
for j = 2:n 
        o = array(:,j);
        %incrementing phis now
        for i = 1:j-1
            o = o - outputMat(:,i)*sum(array(:,j).*conj(outputMat(:,i)))
        end
        outputMat(:,j) = o/norm(o);
end






end

