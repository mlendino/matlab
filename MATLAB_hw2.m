%okay lets begin
clc;
clear all;
 
%% approximate derivatives and integrals
%create two vectors of length 100 and 1000, each containing evenly spaced
%samples of the sine function over one period
x1 = linspace(0,2*pi,100);
x2 = linspace(0,2*pi,1000);
y1 = sin(x1);
y2 = sin(x2);
 
%approximate derivatives of both vectors
dydx1 = diff(y1)./diff(x1);
dydx2 = diff(y2)./diff(x2);
%now dydx1 and dydx2 represent length 99 and 999 approximations to the
%cosine function since d(sinx)/dx is cosx; create two new vectors of length
%99 and 999 of evenly spaced samples over the same interval and compute the
%respective differences
approx1 = linspace(0,2*pi,99);
approx2 = linspace(0,2*pi,999);
y3 = cos(approx1);
y4 = cos(approx2);
%finding maximum of absolute value of these differences
diff1 = max(abs(y3 - dydx1));
diff2 = max(abs(y4 - dydx2));
%it seems as if the better estimate was when we took more approximations,
%which is not surprising
%now lets approximate the integrals of the original vectos 
y1cumt = cumtrapz(y1)*(2*pi/100);
y1cums = cumsum(y1)*(2*pi/100);
y2cumt = cumtrapz(y2)*(2*pi/1000);
y2cums = cumsum(y2)*(2*pi/1000);
%compare the error values to the analytic integral of the sine over one
%period, unsurprisingly in both cases, the trapezoidal estimation had less
%error
diff3 = max(abs(y1cumt + cos(x1)));
diff4 = max(abs(y1cums + cos(x1)));
diff5 = max(abs(y2cumt + cos(x2)));
diff6 = max(abs(y2cums + cos(x2)));
%plot better estimation for derivative, give title
xhat = x2(1: end - 1);
plot(xhat, dydx2);
 
%% Perform the following matrix operations
%use reshape to create a 10x10 matrix A where a11=1,a21=2,a31=3...a1010=100
B = 1:100;
A = reshape(B, [10,10]);
%flip the second column of A st the column is inverted up down
 A(:,2) = flipud(A(:,2));
%flip the matrix from left to right
ltr = fliplr(A);
%make a vector that is the column wise sum of every column of A, the result
%should be a row vector
sumCol = sum(A);
%make a vector that is the row wise mean of every row of A, the result
%should be a column vector
meanRow = mean(A);
%delete the last column of A
A(:,10)= [];
 
%% tic toc fun time
%use tic toc to time the speed of each and write a comment noting the order
%of the speeds of these methods
%this one is the slowest at 0.013987 s
tic 
for k = 1:300;
   for l = 1:500;
       MAT1(k,l) = (k^2 + l^2)/(k + l + 3);
   end
end
toc
%Using for loops and pre allocating memory with zeros
%here is the pre allocation
%This one was the second slowest at 0.003307 s
tic
MAT2 = zeros(300,500);
for g = 1:300;
   for h = 1:500;
      MAT2(g,h) = (g^2 + h^2)/(g + h + 3);
   end
end
toc

%Using only elementwise matrix operations, this one is the fastest at
%0.002671 s
i = 1:500;
j = 1:300;
%creating two arrays I and J; vector i is copied row-wise and vector j is
%transposed and copied column wise
[I,J] = meshgrid(i,j);
%tic toc is required to determine and thus compare the relative speeds of
%the respective methods for these questions
tic
MAT = (I.^2 + J.^2)./(I + J + 3);
toc