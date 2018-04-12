%okay lets begin
clc;
clear all;
%% Generate a signal that consists of a sum of sine waves of frequencies 1 to 50 kHz for t between 0 and 2 seconds
f = 1:50;
t = linspace(0,2,2001);

signal = sum(sin(2*pi*f'.*t), 1);
%we will be applyin each filter to this signal using filter, and p[lotting
%the Fourier Transform using fft and plot
%% Create a Butterworth lowpass filter 
Fs = 100e3;
Apass = 5;
Astop = 50;
Fpass = 10e3;
Fstop = 20e3;
%normalized to nyquist freq.
wpass = 2*Fpass/Fs; 
%normalized to nyquist freq.
wstop = 2*Fstop/Fs; 
n = buttord([wpass],[wstop],Apass,Astop);
[b,a] = butter(n,[wpass]);
y = filter(b, a, signal);
S = fft(y,n);
S = fftshift(abs(S))/n;
F = Fs.*(-n/2:n/2-1)/n;
figure
plot(F,S);
title('Butterworth Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
%% Create a Chebychev I highpass filter
Fs = 100e3;
Apass = 2;
Astop = 40;
Fpass = 35e3;
Fstop = 15e3;
%normalized to nyquist freq.
wpass = 2*Fpass/Fs; 
%normalized to nyquist freq.
wstop = 2*Fstop/Fs; 
n = cheb1ord([wpass], [wstop], Apass, Astop);
[b,a] = cheby1(n,Apass, [wpass], 'high');
y = filter(b, a, signal);
S = fft(y,n);
S = fftshift(abs(S))/n;
F = Fs.*(-n/2:n/2-1)/n;
figure
plot(F,S);
title('Chebychev I highpass filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
%% Create a Chebychev II bandstop filter
Fs = 100e3;
Apass = 5;
Astop = 50;
Fpass = [5e3, 45e3];
Fstop = [15e3, 35e3];
%normalized to nyquist freq.
wpass = 2*Fpass/Fs; 
%normalized to nyquist freq.
wstop = 2*Fstop/Fs; 
n = cheb2ord([wpass], [wstop], Apass, Astop);
[b,a] = cheby2(n,Astop, [wstop], 'stop');
y = filter(b, a, signal);
S = fft(y,n);
S = fftshift(abs(S))/n;
F = Fs.*(-n/2:n/2-1)/n;
figure
plot(F,S);
title('Chebychev II Bandstop Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
%% Create an Elliptic bandpass filter
Fs = 100e3;
Apass = 5;
Astop = 50;
Fpass = [20e3, 30e3];
Fstop = [15e3, 35e3];
%normalized to nyquist freq.
wpass = 2*Fpass/Fs; 
%normalized to nyquist freq.
wstop = 2*Fstop/Fs; 
n = ellipord([wpass], [wstop], Apass, Astop);
[b,a] = ellip(n,Apass, Astop, [wpass]);
y = filter(b, a, signal);
S = fft(y,n);
S = fftshift(abs(S))/n;
F = Fs.*(-n/2:n/2-1)/n;
figure
plot(F,S);
title('Elliptic Bandpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
