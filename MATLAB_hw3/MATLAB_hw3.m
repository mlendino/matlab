%okay lets begin
clc;
clear all;
 
%% Basic Image Processing Techniques
A = ones(100);
B = zeros(100);

i = (1:100);
j = (1:100);
%using the hint that meshgrid is useful to create indices
[I,J] = meshgrid(i,j);

%In Matrix A, set the values of entry 
cond1 = logical(sqrt(((I-50).^2) + ((J-50).^2)) < 20);
A(cond1) = 0;
cond2= logical(sqrt(((I-40).^2) + ((J-40).^2)) < 20);
B(cond2) = 1;

%visualizes A
figure
imshow(A)
%visualizes B
figure
imshow(B)
%visualizes the intersection between A and B
figure
imshow(A & B)
%visualizes the union of A and B
figure
imshow(A | B)
%visualizes the complement of the intersection between A and B
figure
imshow(~(A&B))
%visualizes the complement of the union between A and B
figure
imshow(~(A|B))

%% Fun with Find
%function findClosest() is found in the other file, this line of code is
%showing that it works by finding the value closest to 3/2 (desired value) and its index in
%sin(linspace(0,5,100))+1 (our input)
[ind, val] = findClosest(sin(linspace(0,5,100))+1, 3/2);

%% Sincing Ship ha ha ha
%creating 10001 linearly spaced points on the interval -2pi to 2pi
x = linspace(-2*pi, 2*pi, 10001);
%for every x, we then apply the sinc() function to it
y = sinc(x);
%plot it
figure
plot(x, y)

%see second other function for locating the indices at which the input
%vector transitions from one sign to another

%apply this function to the sinc created
apply = signChange(y);
%finding the roots (x and y coordinates) 
xRoots = x(apply);
yRoots = y(apply);
%hold on retains plots in the current axes 
%so that new plots added to the axes do not delete existing plots
hold on
%plotted them below, as per the instructions on the hw sheet
plot(xRoots, yRoots, 'ko')

%now we want to find the local extremum, mins and maxs 
%apply the function to the approximate derivative of the sinc() to obtain
%their locations
dy = diff(y);
loc = signChange(dy);
xMinMax = x(loc);
yMinMax = y(loc);
hold on
%plot the extremum as red stars on top of the sinc
plot(xMinMax, yMinMax, 'r*')
%%