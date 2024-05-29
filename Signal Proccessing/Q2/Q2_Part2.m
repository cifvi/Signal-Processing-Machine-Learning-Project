%% The magnitude of the DFT:
clear;
clc;
% Define the function y
y = @(x) (x.^3);

% Assign the values of the given parameters
F_0 = 20;
N = 50; 
fs = 1000; 
T = 1/fs; 
a = 0.25; % Dead-zone parameter

% Create the input signal x[n]
n = 0:N-1; 
x = cos(2.*pi.*F_0.*n.*T);

% Evaluate the output signal y[n] using the function y
y_out = y(x); % Calculate output signal

% Plot the DFT of y[n] as a function of frequency f
Y = fft(y_out); % Compute DFT
f = linspace(0,fs/2,N/2); % Create frequency vector

% Plot DFT magnitude 
stem(f,abs(Y(1:N/2)), "filled", 'red') 
xlabel('Frequency (Hz)') % Label x-axis
ylabel('Magnitude') % Label y-axis
title('DFT of y[n]') % Add title
grid on % Add grid lines

%% Calculate the THD:
Y = fft(y_out);
d = abs((Y)/(N/2));

 % Calculate power of output signal
Py = (d(1).^2)/4 + (1/2)*sum(d(2:(N/2)-1).^2);

% Calculate THD of output signal
Y_thd = 100.*(Py-d(2).^2/2)./Py; 
disp(['The THD of y[n] is ', num2str(Y_thd), '%'])