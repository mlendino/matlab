%okay lets begin
clc;
clear all;

%% Create 4 scalar variables with the values on the hw sheet, unique names
natLogNine = log(9);
arcSineBlah = asin(exp(-9)) * 10 ^ 4;
notNatLog = log10((2 * pi)/9);
complex = 9 +j;
%make a column vector containing each of these four variables in order as
%entries
column = [natLogNine ; arcSineBlah ; notNatLog ; complex];

%% Compute the Re(), Im(), magnitude, and phase of the complex variable
%%from Q1, and store them as variables
real = real(complex);
imag = imag(complex);
mag = abs(complex);
phi = angle(complex);
%create row vector w these values using variable names
row = [real imag mag phi];

%% Multiply two vectors of length 4 in both orders and store these values in
%%variables
val1 = row * column;
val2 = column * row;

%% Transpose one matrix from either Q1 or Q2 and find the elementwise
%%product of these two vectos
row2 = transpose(row);
new = column.*row2;
%using repmat create a 4x4 matrix whose columns are each this vector
repeat = repmat(new, 1, 4);

%% Perform operations for 4x4 matrices from Q3 and Q4
%Matrix Multiplication
matMul = val2*repeat;
%Elementwise multiplication
elementMul = val2.*repeat;
%Conjugate Transpose of either one
conjTrans = val2';
%Inverse of the sum of either matrix with the 4x4 identity
iden = eye(4);
inv(val2 + iden);
%Square of either matrix
val2 ^ 2;

%% Question 6
%round down the real part of the complex scalar using fix(), store as 
%variable called n
n = fix(val1);
%create two vectors, one containing 1000 evenly spaced points between 1 and
%n, and the other containing values between 1 and n spaced in interval of
%size 0.1
points = linspace(1,n,1000);
incr = 1:0.1:n;

%% QED