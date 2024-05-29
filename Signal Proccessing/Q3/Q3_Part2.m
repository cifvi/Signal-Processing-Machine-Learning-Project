%% B 
clear;
clc;

% Define the data
r = 0.9;
n = 0:127;

% Define delta function
x = [1 zeros(1,127)];

y = zeros(1,128);

% Set the first value of y[n] to the first value of x[n]
y(1) = x(1);

% Set the second value of y[n] using the formula given in the problem
y(2) = -r^2*y(1) + x(2);

% Use a for loop to calculate the remaining values of y[n]
for i=3:length(n)
    y(i) = -r^2*y(i-2) + x(i);
end

% Calculate w[n]
w = (0.92.^-n).*y;

% Calculate the DFT of w[n]
W = fft(w);

% Plot the magnitude of W[k]
figure;
k = (1:1:128);
stem(k,abs(W), "filled", 'red');
title('Magnitude of W[k]');
grid on;
xlabel('k');
ylabel('|W[k]|');
xlim([1,128]);