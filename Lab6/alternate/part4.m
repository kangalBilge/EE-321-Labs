% Clear workspace and close all figures
clear;
close all;

% Load instrument recordings
[bassoon, Fs] = audioread('bassoon.flac');
[cello, ~] = audioread('cello.flac');
[flute, ~] = audioread('flute.flac');
[trumpet, ~] = audioread('trumpet.flac');

% Prepare for FFT
N = 2048; % Number of FFT points
f = linspace(0, Fs/2, N/2+1); % Frequency vector

% Calculate FFT for each instrument
Y_bassoon = fft(bassoon, N);
Y_cello = fft(cello, N);
Y_flute = fft(flute, N);
Y_trumpet = fft(trumpet, N);

% Plot frequency spectra for all instruments
figure;
subplot(4,1,1);
plot(f, abs(Y_bassoon(1:N/2+1)));
title('Frequency Spectrum of Bassoon');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(4,1,2);
plot(f, abs(Y_cello(1:N/2+1)));
title('Frequency Spectrum of Cello');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(4,1,3);
plot(f, abs(Y_flute(1:N/2+1)));
title('Frequency Spectrum of Flute');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(4,1,4);
plot(f, abs(Y_trumpet(1:N/2+1)));
title('Frequency Spectrum of Trumpet');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Optional: Enhance plot appearance
sgtitle('Frequency Spectra of Instruments'); % Super title for all subplots
set(gcf, 'Position', [100, 100, 600, 800]); % Adjust figure size

% Design low-pass and high-pass filters
N = round(0.01 * Fs); % Filter length
sigmaLPF = 0.4;
sigmaHPF = 0.02;
range = -floor(N/2):floor(N/2);

N = 1000; % Number of points
Fxs = 1000; % Sampling frequency

% Define the frequency range
f = (-Fxs/2):(Fxs/N):(Fxs/2-Fxs/N); % Frequency range

% Compute the Gaussian function in the frequency domain
HLPF = exp(-(pi^2*sigmaLPF^2*f.^2));
HHPF = 1 - exp(-(pi^2*sigmaHPF^2*f.^2));
figure;
subplot(2, 1, 1);
plot(f, abs(HLPF), 'b', 'LineWidth', 2);
hold on;
plot(f, abs(HHPF), 'r', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Responses of LPF and HPF');
legend('LPF', 'HPF');

% Blend the recordings
blended = (bassoon + cello + flute + trumpet) / 4;
HLPF = ifft(HLPF);
HHPF = ifft(HHPF);
% Apply filters
blendedLPF = conv(blended, HLPF, 'same');
blendedHPF = conv(blended, HHPF, 'same');

% Plot original and filtered blended recordings
figure;
subplot(3,1,1);
plot(blended);
title('Original Blended Recording');
xlabel('Time (samples)');
ylabel('Amplitude');

subplot(3,1,2);
plot(blendedLPF);
title('Blended Recording with Low-Pass Filter');
xlabel('Time (samples)');
ylabel('Amplitude');

subplot(3,1,3);
plot(blendedHPF);
title('Blended Recording with High-Pass Filter');
xlabel('Time (samples)');
ylabel('Amplitude');

% Play the original and filtered sounds for auditory comparison
disp('Playing original blended recording...');
sound(blended, Fs);
pause(length(blended)/Fs + 2);

disp('Playing blended recording with Low-Pass Filter...');
sound(blendedLPF, Fs);
pause(length(blendedLPF)/Fs + 2);

disp('Playing blended recording with High-Pass Filter...');
sound(blendedHPF, Fs);



