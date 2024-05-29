%% Impulse Response
clear;
clc;

n = 0:9;
r=0.96; 
fs=200; 
b = (1+r^10).*[1,0,0,0,0,0,0,0,0,0,-1]; % numerator coefficient of the filter function
a = [1 r.^n.*[0 0 0 0 0 0 0 0 0 -1]].*2; % denominator coefficient of the filter function


figure; 

impulse = [1, zeros(1, fs)]; % create an impulse signal with 1 followed by fs zeros
h = filter(b, a, impulse); % apply the filter to the impulse signal and get the impulse response

subplot(1,2,1); 
stem(0:fs, h, 'filled', 'r'); 

title('Impulse Response (filter)');
xlabel('n');
ylabel('h[n]');
grid on;

%% Magnitude

[h,f] = freqz(b,a,fs,fs); % calculate frequency response at fs points
subplot(1,2,2); 
plot(f,abs(h)); % plot magnitude as a function of frequency in Hz
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;