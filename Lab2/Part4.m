% Define parameters
fs = 8192; % Sampling rate (samples per second)
recordingDuration = 10; % Duration of recording in seconds

% Create audiorecorder object
recObj = audiorecorder(fs, 16, 1); % 16 bits per sample, 1 channel (mono)

% Start recording
disp('Start speaking.');
recordblocking(recObj, recordingDuration); % Record for specified duration
disp('End of recording.');

% Retrieve recorded data
voiceData = getaudiodata(recObj);


filename = 'TotalNumber.flac';
audiowrite(filename,voiceData,fs);
% Save recorded audio as .flac file
