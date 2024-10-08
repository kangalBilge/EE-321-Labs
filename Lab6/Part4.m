
[orchestra1, Fs_orig] = audioread('bassoon.flac');
[orchestra2, ~] = audioread('cello.flac');
[orchestra3, ~] = audioread('flute.flac');
[orchestra4, ~] = audioread('trumpet.flac');

Fs =Fs_orig/10;
N = 4096; % Number of samples for frequency response calculation

f = linspace(0, Fs/2, N/2+1); % Frequency vector
% Create frequency vector
w = linspace(-pi, pi, N);
orchestra1=resample(orchestra1,Fs,Fs_orig);
orchestra1 = orchestra1.';
n = 0:length(orchestra1)-1;
orchestra1_Fourier = DTFT(orchestra1,n,f);
orchestra2=resample(orchestra2,Fs,Fs_orig);
orchestra2 = orchestra2.';
orchestra2_Fourier = DTFT(orchestra2,n,f);
orchestra3=resample(orchestra3,Fs,Fs_orig);
orchestra3 = orchestra3.';
orchestra3_Fourier = DTFT(orchestra3,n,f);
orchestra4=resample(orchestra4,Fs,Fs_orig);
orchestra4 = orchestra4.';
orchestra4_Fourier = DTFT(orchestra4,n,f);
orchestra = (orchestra1 + orchestra2 + orchestra3 + orchestra4)/ 4;
figure;
subplot(2, 2, 1);
plot(f, abs(orchestra1_Fourier), 'b', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Responses of LPF and HPF');
subplot(2, 2, 2);
plot(f, abs(orchestra2_Fourier), 'b', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Responses of LPF and HPF');
subplot(2, 2, 3);
plot(f, abs(orchestra3_Fourier), 'b', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Responses of LPF and HPF');
subplot(2, 2, 4);
plot(f, abs(orchestra4_Fourier), 'b', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Responses of LPF and HPF');
sigma_LPF = 0.4;
sigma_HPF = 1;
N = 4096; % Number of samples for frequency response calculation

f = linspace(0, Fs/2, N/2+1); % Frequency vector
% Create frequency vector
w = linspace(-pi, pi, N);

% Calculate frequency responses for LPF and HPF
sigmaLPF = 0.4;
sigmaHPF = 0.02;
range = -floor(N/2):floor(N/2);

N = 1000; % Number of points
Fs = 1000; % Sampling frequency

% Define the frequency range
f = (-Fs/2):(Fs/N):(Fs/2-Fs/N); % Frequency range

% Compute the Gaussian function in the frequency domain
HLPF = exp(-(pi^2*sigmaLPF^2*f.^2));
HHPF = 1 - exp(-(pi^2*sigmaHPF^2*f.^2));

% Plot the magnitude of the frequency response
figure;
plot(f, abs(HHPF));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of High-Pass Gaussian Filter Frequency Response');
grid on;
% Step 2: Plot Frequency Responses
figure;
subplot(2, 1, 1);
plot(f, abs(HLPF), 'b', 'LineWidth', 2);
hold on;
plot(f, abs(HHPF), 'r', 'LineWidth', 2);
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Responses of LPF and HPF');
legend('LPF', 'HPF');



LPF_output = conv(orchestra, IDTFT(HLPF,n,f),"same");
HPF_output = conv(orchestra, IDTFT(HHPF,n,f),"same");


t = (0:length(orchestra)-1) /Fs ;
figure;
subplot(3, 1, 1);
plot(t, orchestra);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Recording');

subplot(3, 1, 2);
plot(t, LPF_output);
xlabel('Time (s)');
ylabel('Amplitude');
title('Output of LPF');

subplot(3, 1, 3);
plot(t, HPF_output);
xlabel('Time (s)');
ylabel('Amplitude');
title('Output of HPF');
soundsc(orchestra, Fs);
pause(length(orchestra) / Fs);
soundsc(real(LPF_output), Fs);
pause(length(LPF_output) / Fs);
soundsc(real(HPF_output), Fs);
% % Step 3: Import Instrument Recordings
% % Load instrument recordings
% [orchestra1, Fs1] = audioread('bassoon.flac');
% [orchestra2, Fs2] = audioread('cello.flac');
% [orchestra3, Fs3] = audioread('flute.flac');
% [orchestra4, Fs4] = audioread('trumpet.flac');
% % Conduct frequency domain analysis for each recording (DTFT)
% 
% % Step 4: Blend Recordings with LPF and HPF
% % Blend recordings to create orchestra recording
% orchestra = (orchestra1 + orchestra2 + orchestra3 + orchestra4).'/ 4;
% 
% n = 0:length(orchestra)-1;
% 
% % Step 2: Plot Frequency Responses
% figure;
% subplot(2, 1, 1);
% plot(w, abs(HLPF), 'b', 'LineWidth', 2);
% hold on;
% plot(w, abs(HHPF), 'r', 'LineWidth', 2);
% xlabel('Frequency (rad/sample)');
% ylabel('Magnitude');
% title('Frequency Responses of LPF and HPF');
% legend('LPF', 'HPF');
% 
% 
% filtered1 = DTFT(orchestra,n,w) .* HLPF;
% filtered2 = DTFT(orchestra,n,w) .* HHPF;
% 
% LPF_output = IDTFT(filtered1,n,w);
% HPF_output = IDTFT(filtered2,n,w);
% 
% % Step 5: Create Subplot of Results
% t = (0:length(orchestra)-1) /targetFs ; % Time vector
% figure;
% subplot(3, 1, 1);
% plot(t, orchestra);
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Original Recording');
% 
% subplot(3, 1, 2);
% plot(t, LPF_output);
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Output of LPF');
% 
% subplot(3, 1, 3);
% plot(t, HPF_output);
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Output of HPF');
% 
% % Listen to each result and comment on the eliminated instruments
% soundsc(orchestra, Fs1);
% pause(length(orchestra) / Fs1);
% soundsc(real(LPF_output), Fs1);
% pause(length(LPF_output) / Fs1);
% soundsc(real(HPF_output), Fs1);