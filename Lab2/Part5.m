[audio_array, fs] = audioread(' TotalNumber2.flac');
audio_len = length(voiceData);
t1 = 1:audio_len;
t1=t1/fs;
google_array = reshape(audio_array,1,length(audio_array));
power_array = reshape(audio_array,1,length(audio_array)).^2;
p_signal = sum(power_array)/length(power_array);
disp("Power of signal:")
disp(p_signal);
snr_val = [10,0.1,0.001];
rng (5)
for i = snr_val
    p_noise = p_signal/i;
    disp("Power of noise added signal:")
    disp(p_noise)
    awgn = sqrt ( p_noise ).* randn ([ audio_len , 1]);
    awgn = reshape(awgn,1,length(awgn));
    noisy_audio = awgn + google_array;
    soundsc(noisy_audio,fs);
    pause(8)
end