%okay lets begin
clc;
clear all;

%% See comments for description of what it does for the most part
%test the functions on random complex vectors where there are more elements
%in each vector than the number of vectors
%the system is over constrained and returns an error
case1 = rand(5,2) + 1j*rand(5,2);
input = rand(5,1);
GS1 = gramSchmidt(case1);
isOrthonormal(GS1);
proj1 = orthoProj(input, GS1)
error1 = norm(proj1 - case1);
%now test the functions on a random complex vector where the number of
%vectors is equal to the number of elements in a vector
case2 = rand(5,5) + 1j*rand(5,5);
GS2 = gramSchmidt(case2);
isOrthonormal(GS2);
proj2 = orthoProj(input, GS2)
error2 = norm(proj2 - case2);

sprintf('The relative errors are %d for the case where there are more elements in each vector and %d for the case where the number of vectors is equal to the number of elements in a vector', error1,error2)

x = linspace(0, 2*pi, 1000);
y = sin(x);

mu = linspace(0, 2*pi, 5);
[X1,X2] = ndgrid(x,mu);
%Gaussian formula w sigma = 1
gauss = (1/sqrt(2*pi))*exp(-(X1-X2).^2)
plot(x, y, 'DisplayName', 'sin(x)')
xlabel('x')
ylabel('f(x)')
title('Plot of the Sinusoid and Gaussian')
legend('show')
grid on
%using gramSchmidt() to create an orthonormal set of vectors from Gaussians
orthNorm = gramSchmidt(gauss);
%use orthoProj to estimate the sinusoid from that set of vectors from the
%Gaussians
est = orthoProj(y.', orthNorm)

figure;
%create a 2x1 subplot
subplot(2,1,1)
%plot the sinusoid and the estimated sinusoid together on the upper plot
plot(x,y)
xlabel('x')
ylabel('f(x)')
title('Actual Sinusoid Mapped With Estimated Sinusoid')
hold on;
plot(x, est)

%plot the orthonormal basis functions on the lower plot
subplot(2,1,2)
for i = 1:5
    plot(x, orthNorm(:,i))
    hold on
end
xlabel('x')
ylabel('f(x)')
title('Orthonormal Basis Functions')
