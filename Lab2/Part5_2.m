[audio_array, fs] = audioread(' TotalNumber2.flac');
[filter, fs_n] = audioread('2.flac');
filter = reshape(filter,1,length(filter));
filter = flip(filter);
snr = 0.01:-0.001:0.001;
audio_len = length(audio_array);
t1 = 1:audio_len;
t1=t1/fs;
google_array = reshape(audio_array,1,length(audio_array));
power_array = reshape(audio_array,1,length(audio_array)).^2;
p_signal = sum(power_array)/length(power_array);
rng(5);
figure;
for i = snr
    p_noise = p_signal/i;
    disp(i)
    awgn = sqrt ( p_noise ).* randn ([ audio_len , 1]);
    awgn = reshape(awgn,1,length(awgn));
    noisy_audio = awgn + google_array;
    output = ConvFUNC(noisy_audio,filter);
    t_new = (1:length(output))/fs;
    index = find(snr == i);
    subplot(5,2,index);
    plot(t_new , output);
end
