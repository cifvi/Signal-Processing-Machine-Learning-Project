function X = dft_filter(k,x)
% A
% This function calculates the DFT values for a signal x using equations
% (1),(2) and filter()
% k is a vector of the k values to calculate the DFT for
% x is a vector of the input signal
% X is a vector of the DFT values
% Get the length of the signal
N = length(x);

% Define the filter coefficients b and a
W = exp(-1j*2*pi/N); %Defining W
b = [1, 0]; % Numerator coefficient
a = [1 W]; % Denominator coefficient

% Initialize the output vector X
X = zeros (1, length(k));
% Loop over the k values
    for i = 1:length(k)
        % Calculate y_k using the filter function
        %Instead of implementing W^(-k(i)) we used the line below: 
        %since a(0) = 1 it will not affect it and do what we want for the
        %rest of of the W's.
        y_k = filter(b,-(a.^-k(i)),x); %(1)
        
        % Calculate X[k] using equation (2)
        X(i) = y_k(N);
    end
end
