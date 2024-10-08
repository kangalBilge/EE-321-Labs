% Clear the workspace and close all figures
clear;
close all;

% Load the audio data
[data, Fs] = audioread('Part3_recording.flac');

% Define the length of the filters based on the sampling frequency
N = round(0.01 * Fs);

% Simple Moving Average Filter
hSMA = ones(1, N) / N;

% Gaussian Moving Average Filters with different sigmas
sigma = 0.7; 
hGMA = exp(-0.5 * ((-floor(N/2):floor(N/2)) / sigma).^2);
hGMA = hGMA / sum(hGMA);


% Apply the filters
filteredSMA = conv(data, hSMA, 'same');
filteredGMA = conv(data, hGMA, 'same');


% Plot the original and filtered signals
figure;
subplot(3,1,1);
plot(data);
title('Original Recording');
xlabel('Time (samples)');
ylabel('Amplitude');

subplot(3,1,2);
plot(filteredSMA);
title('Simple Moving Average Filtered');
xlabel('Time (samples)');
ylabel('Amplitude');

subplot(3,1,3);
plot(filteredGMA);
title(['Gaussian Moving Average Filtered (\sigma = ', num2str(sigma), ')']);
xlabel('Time (samples)');
ylabel('Amplitude');



% Play the original and filtered sounds for auditory comparison
disp('Playing original recording...');
sound(data, Fs);
pause(length(data)/Fs + 2);

disp('Playing SMA filtered recording...');
sound(filteredSMA, Fs);
pause(length(filteredSMA)/Fs + 2);

disp('Playing GMA filtered recording (\sigma = 0.7)...');
sound(filteredGMA, Fs);
pause(length(filteredGMA)/Fs + 2);

