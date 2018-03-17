%okay lets begin
clc;
clear all;

%% Question 1, given transfer function
%store transfer function as numerator and denominator vectors then use
%single BUILT IN functions to find the poles and zeros then plot the poles
%and zeros of H
%for numerator polynomial
n = [3/7 2/3 1/2];
%for denominator polynomial
d = [1/2 0 1/3 2];
%tf2zp finds the zeros, poles, and gains of a continuous-time transfer function.
[z, p, k] = tf2zp(n, d);
%plot poles and zeros
figure
zplane(z, p)
title('Pole/Zero Plot');
%Use impz to obtain the first 50 points of the impulse response and plot them using the
%appropriate plotting function
%[h t] = impz(b,a,k) to get the impulse response h as a vector
[h,t] = impz(n, d, 50);
figure
grid on;
stem(t,h) %since we're plotting the first 50 samples of the impulse response in the discrete time domain, we use stem()
title('Impulse Response');
xlabel('n');
ylabel('h[n]');
%given this x[n], taking n from 0 to 99
x = (-3/4).^(0:99);
[h1, t1] = impz(n, d, 100);
% Apply the digital filter H to x using filter and plot the result
%y = filter(b,a,x) returns the output signal y of the system described by b and a with input x.
y = filter(n, d, x);
figure
stem(t1, y)
title('Application of H to x');
xlabel('n');
ylabel('y1[n]');
%we can also apply filters using convolution
y2 = conv(h1, x);
y2 = y2(1:100);
figure
stem(t1, y2)
title('Application of H to x via Convolution');
xlabel('n');
ylabel('y2[n]');

%% Consider a discrete time system whose impulse response is the fibonacci sequence (canonically written as y[n] = x[n] + y[n-1] + y[n-2])!
%Use a for loop to generate the first 100 values of the Fibonacci sequence
%and plot these values using semilogy
fibonacci = zeros(1,100);
fibonacci(1) = 1;
fibonacci(2) = 1;
%ew
for i = 3:100
    fibonacci(i) = fibonacci(i-1) + fibonacci(i-2);
end
figure
%semilogy plots data with logarithmic scale for the y-axis
%as its inputs it takes domain, function, and the line specification
semilogy(0:99, fibonacci, '.')
title('First 100 Values of Fibonacci Sequence')
xlabel('n')
ylabel('Fibonacci Sequence')
%Assuming this is the impulse response of a system, find the output of the system (y) with input x[n] from the above problem and plot it using an appropriate function.
%first need to turn difference equation into transfer function bc need the
%h in y=h*x
%after some algebra, we find H(z) = (z^2)/(z^2 - z -1), zero at zero w
%multiplicity 2, and poles at 0.5 \pm  sqrt(5)/2
n1 = [1 0 0];
d1 = [1 -1 -1];
[h2,t2] = impz(n1, d1, 100);
y3 = conv(h2,x);
y3 = y3(1:100);
figure
stem(t2, y3)
title('Fibonacci Sequence Convoluted with x[n]');
xlabel('n');
ylabel('y3[n]');