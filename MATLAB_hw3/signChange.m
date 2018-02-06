%the goal of this function is to locate the indices at which the input
%vector x transitions from one sign to another, this is not done in one
%line of code because i am lazy tonight
function SC = signChange(v)
%defining the original vector
    w = (v >= 0);
    %defining the original version of the vector on some interval
    original = w(1:end-1);
    %defining the shifted version of the vector one spot later
    shifted = w(2:end);
    %xor'ing the vector and the shifted version of the vector and returning
    %a column vector of the linear indices of the result
    SC = find(xor(original, shifted));
end

