
[y_orig, Fs] = audioread('Part3_recording.flac');
targetFs=Fs/30;
y=resample(y_orig,targetFs,Fs);
y = y.';

sound(y, targetFs);


N = round(0.01 * targetFs);
sigma = 0.7;
mu = 0;

h_SMAV = ones(1, N) / N;

n = linspace(-5,5,N);

h_GMAV = 1 / (sigma * sqrt(2 * pi)) * exp(-(n - mu).^2 / (2 * sigma^2));


y_SMAV = ConvFUNC_M(y, h_SMAV);

y_GMAV = ConvFUNC_M(y, h_GMAV);


sound(y_SMAV, targetFs);
disp('Playing y_SMAV');
pause(length(y_SMAV)/targetFs + 2);
sound(y_GMAV, targetFs);
disp('Playing y_GMAV');
pause(length(y_GMAV)/targetFs + 2);

t = (0:length(y)-1) / targetFs;
subplot(2, 2, 1);
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Noisy Signal');
t = (0:length(y_SMAV)-1) / targetFs;
subplot(2, 2, 3);
plot(t, y_SMAV);
xlabel('Time (s)');
ylabel('Amplitude');
title('Output with SMAV Filter');
t = (0:length(y_GMAV)-1) / targetFs;
subplot(2, 2, 4);
plot(t, y_GMAV);
xlabel('Time (s)');
ylabel('Amplitude');
title('Output with GMAV Filter');
