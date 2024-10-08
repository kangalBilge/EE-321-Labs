% Define the parameters
N = 1000; % Number of points
Fs = 1000; % Sampling frequency
sigma = 0.02; % Standard deviation for the Gaussian function

% Define the frequency range
f = (-Fs/2):(Fs/N):(Fs/2-Fs/N); % Frequency range

% Compute the Gaussian function in the frequency domain
HLPF = exp(-(pi^2*sigma^2*f.^2));

% Plot the magnitude of the frequency response
figure;
plot(f, abs(HLPF));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of Low-Pass Gaussian Filter Frequency Response');
grid on;