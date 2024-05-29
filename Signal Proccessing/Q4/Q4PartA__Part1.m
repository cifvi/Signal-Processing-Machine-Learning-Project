%% A

% Define the transfer function H(Z)
z = tf('z');
H = (0.2*((z+0.5)^2+1.5^2))/(z^2-0.64);

% Get the numerator and denominator coefficients of H(Z)
[num,den] = tfdata(H,'v');

% Compute the frequency response of H(Z)
[h,f] = freqz(num,den);

% Plot the magnitude of the frequency response
figure;
subplot(2,1,1)
plot(f,abs(h))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude of frequency response of H(Z)')
grid on;
xlim([0 3.14]);

% Compute the poles and zeros of H(Z)
p = roots(den);
z = roots(num);

% Plot the pole-zero map of the filter
subplot(2,1,2)
zplane(z,p)
xlabel('Real part')
ylabel('Imaginary part')
legend('Zeros','Poles')
title('Pole-Zero map of H(Z)')
grid on
