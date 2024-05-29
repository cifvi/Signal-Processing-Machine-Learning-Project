%% Impulse Response
clear;
clc;

n = 0:9; 
r=0.98; 
fs=300; 
b = 1-r^10; % numerator coefficient of the filter function
a = [1,0,0,0,0,0,0,0,0,0,r^10]; % denominator coefficient of the filter function


figure; 

impulse = [1, zeros(1, fs)]; % create an impulse signal with 1 followed by fs zeros
h = filter(b, a, impulse); % apply the filter to the impulse signal and get the impulse response

subplot(1,2,1);
stem(0:fs, h, 'filled', 'r');

title('Impulse Response');
xlabel('n');
ylabel('h[n]');
grid on;

%% Magnitude

%Drawing for magnitude of the frequency response:
[h,f] = freqz(b,a,fs,fs); % calculate frequency response at fs points
subplot(1,2,2); 
plot(f,abs(h)); % plot magnitude as a function of frequency in Hz
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;