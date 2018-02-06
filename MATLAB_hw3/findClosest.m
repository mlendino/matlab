%goal of the function is to return the value and index of a number in a
%vector/matrix that is closest to a desired value, notice how it takes in
%as its parameters the matrix and the desired value you want
function [val,ind] = findClosest(x,desiredValue)
%converting the matrix to a vector
y = x(:);
%err is the absolute value of the difference between the value at that
%point in the matrix, which is now a vector, and the desired value
err = abs(y - desiredValue);
%ind takes on the value of the index when the error is minimized
ind = find(err == min(err));
%val takes on the value of the vector at that given index, thus we return
%both the index and vector after this call
val = y(ind);
end

