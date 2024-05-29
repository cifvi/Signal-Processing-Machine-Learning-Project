%% B
clear; clc;
% Defining data
N = 100;
n = 0:N-1; 
fs = 8000; 
T = 1/fs; 
f_d = [490 1280 2730 3120]; % Vector of f_d values
x = zeros (4,length (n)); % Matrix of x values

figure;
% We figured that the only possible k's that could obtain those f_d.
% frequencies are k between 0-100 (periodical) and the ks that match to the
% formula: f/d/(fs/N) because those are the ks that represent the
% frequencies 490(k=6.125), 1280(k=16) ,2730(k=34.125), 3120(k=39).
% using dft properties: f_k = K/NT = Kfs/N (resolution in frequency):
% for each k which is not an integer, we will get spectral leakage.
% we can see the spectral leakage for the said k values as X(k) values that are
% not equal to 0 in places that are different from the impulses.

%k = fd/Δ(f), Δ(f) = fs/N = those values are how we find the correct k's
%per f_d

%We have put more k values so you can see the spectral leakage.
k = [0:99];

for i = 1:4
    % Calculate x for each f_d value
    x = cos(2*pi*f_d(i)*n*T);
    
    % Calculate X using dft_filter function
    X = dft_filter(k,x);
   
    % Plot the magnitude of X for each f_d value
    subplot (4,1,i)
    stem(k,abs(X),"filled",'red')
    xlabel('k')
    ylabel('|X[k]|')
    title (['Magnitude of DFT for f_d = ' num2str(f_d(i)) ' Hz'])
    grid on
end