% Define the signals
t1 = linspace(0, 1, 1000); % Time vector for x1(t)
t2 = linspace(-1, 1, 2000); % Time vector for x2(t)
Ts = 0.001; % Sampling period

% Signal x1(t)
x1_t = 8*cos(10*pi*t1) + 20*sin(6*pi*t1) - 11*cos(30*pi*t1);
% Signal x2(t)
x2_t = exp(-t2);

% a) Fourier series coefficients for x1(t)
% Coefficients calculation manually
a1_1 = 8/2; % Coefficient for 10*pi*t
a1_2 = 20/2i; % Coefficient for 6*pi*t
a1_3 = -11/2; % Coefficient for 30*pi*t

% b) Estimating Fourier series coefficients using FSAnalysis
% For x1(t)
fsCoeffs_x1 = FSAnalysis(x1_t, 30);
% For x2(t)
fsCoeffs_x2 = FSAnalysis(x2_t, 30);

% Plotting real and imaginary parts of estimated coefficients for x1(t)
figure;
subplot(2, 1, 1);
stem(-30:30, real(fsCoeffs_x1));
title('Real Part of Estimated Fourier Series Coefficients for x1(t)');
xlabel('k');
ylabel('Real part');
grid on;

subplot(2, 1, 2);
stem(-30:30, imag(fsCoeffs_x1));
title('Imaginary Part of Estimated Fourier Series Coefficients for x1(t)');
xlabel('k');
ylabel('Imaginary part');
grid on;

figure;
subplot(2, 1, 1);
stem(-30:30, real(fsCoeffs_x2));
title('Real Part of Estimated Fourier Series Coefficients for x2(t)');
xlabel('k');
ylabel('Real part');
grid on;

subplot(2, 1, 2);
stem(-30:30, imag(fsCoeffs_x2));
title('Imaginary Part of Estimated Fourier Series Coefficients for x2(t)');
xlabel('k');
ylabel('Imaginary part');
grid on;
% c) Compute Parseval's Relation for x1(t)
% Energy in time domain
energy_time_domain = sum(abs(x1_t).^2) * Ts; % Multiply by Ts for discrete case

% Energy in frequency domain
energy_freq_domain = sum(abs(fsCoeffs_x1).^2);

fprintf('Energy in time domain: %f\n', energy_time_domain);
fprintf('Energy in frequency domain: %f\n', energy_freq_domain);
