% Load the input signal from the file "x.mat"
load x.mat

% Define the coefficients of the given IIR filter
b = [2 -3 -1 0 4 5 -8]; % Numerator coefficients
a = [1 -1.6 1.75 -1.436 0.6814 -0.1134 -0.0648]; % Denominator coefficients

% Filter the input signal with the IIR filter
d = filter(b,a,x);

% Define the order and step size of the FIR filter
m = 50; % Order of the filter
mu = 0.01; % Step size

% Initialize the FIR filter coefficients as zeros
w = zeros(m+1,1);

% Iterating over the input signal:
% Update the FIR filter output, error, and coefficients:
N = length(x); 
y = zeros(N,1); % Initiallizng y
e = zeros(N,1); % Initiallizing e
for k = m+1:N
    % Input vector of length m+1
    u = x(k:-1:k-m);
    % Reshape u into a column vector of size m+1 by 1
    u = reshape(u,m+1,1);
    % Output as product of coefficients and input vector
    y(k) = w'*u;
    % Error = difference between wanted output and actual output
    e(k) = d(k)-y(k); 
    % Updating coefficients
    w = w + 2*mu*e(k)*u; 
end

% Calculate the squared error e^2(k) for each iteration k
e2 = e.^2;

% Plot e^2(k) as a function of k
figure(1)
plot(0:N-1,e2)
xlabel('k')
ylabel('e^2(k)')
title('Squared Error')
grid on

%Plotting the magnitude of the frequency response of the IIR filter and the FIR filter
figure(2)
[h_iir,w_iir] = freqz(b,a); % Frequency response of the IIR filter
%for FIR filters denominator coefficient is 1 
[h_fir,w_fir] = freqz(w,1); % Frequency response of the FIR filter
plot(w_iir/pi,abs(h_iir),w_fir/pi,abs(h_fir))
xlabel('Frequency')
ylabel('Magnitude')
legend('IIR Filter','FIR Filter')
title('Frequency Response')
grid on
