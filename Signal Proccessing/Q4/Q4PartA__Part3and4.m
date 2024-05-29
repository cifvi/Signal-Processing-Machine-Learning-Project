%Transfer function model 
z = tf('z');

%Minimal Phase Filter
H_MP = (z-(-1/5+3i/5))*(z-(-1/5-3i/5))/((z-0.8)*(z+0.8));

%All Pass Filter
H_AP = 0.2*(z-(-1/2+3i/2))*(z-(-1/2-3i/2))/((z-(-1/5+3i/5))*(z-(-1/5-3i/5)));

% Get the numerator and denominator coefficients of H_AP(Z)
[num_ap,den_ap] = tfdata(H_AP,'v');
[h_ap,f_ap] = freqz(num_ap,den_ap);

% Get the numerator and denominator coefficients of H_MP(Z)
[num_mp,den_mp] = tfdata(H_MP,'v');
[h_mp,f_mp] = freqz(num_mp,den_mp);

% Compute the poles and zeros of H_AP(Z)
p_ap = roots(den_ap);
z_ap = roots(num_ap);

% Compute the poles and zeros of H_MP(Z) 
p_mp = roots(den_mp);
z_mp = roots(num_mp);

% Plot the magnitude of the H_AP
figure;
subplot(4,1,1)
plot(f_ap,abs(h_ap))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude of frequency response of H_A_P(Z)')
grid on;
xlim([0 3.14]);

% Plot the pole-zero map of the H_AP
subplot(4,1,2)
zplane(z_ap,p_ap)
xlabel('Real part')
ylabel('Imaginary part')
legend('Zeros','Poles')
title('Pole-Zero map of H_A_P(Z)')
grid on


% Plot the magnitude of the H_MP
subplot(4,1,3)
plot(f_mp,abs(h_mp))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude of frequency response of H_M_P(Z)')
grid on;
xlim([0 3.14]);

% Plot the pole-zero map of the H_MP
subplot(4,1,4)
zplane(z_mp,p_mp)
xlabel('Real part')
ylabel('Imaginary part')
legend('Zeros','Poles')
title('Pole-Zero map of H_M_P(Z)')
grid on


