[voiceData, fs] = audioread(' TotalNumber2.flac'); %pythondan gelen
[voiceData_my, fs_my] = audioread('TotalNumber.flac');
%[n2, fsx] = audioread('2.flac');%kendi kaydettiğim


audio_len = length(voiceData);
t1 = 1:audio_len;
t1=t1/fs;
t_my = linspace(0, 10, 10*fs_my);
figure;

%soundsc(voiceData, fs);
%soundsc(voiceData_my, fs_my);

subplot(2, 1, 1);
plot( t1, voiceData);
xlabel('t');
ylabel('Amplitude');
title('gTTS Audio');
grid on;
subplot(2, 1, 2);
plot( t_my, voiceData_my);
xlabel('t');
ylabel('Amplitude');
title('My Voice');
grid on;


n1=2;
n2=6;


n1_ext = voiceData_my(4.7*fs_my:5.5*fs_my);
%soundsc(n1_ext,fs_my);
filename = 'n1.flac';
audiowrite(filename,n1_ext,fs_my);
n1_phil = flip(n1_ext);
cell_array = reshape(n1_ext,1,length(n1_phil));
voiceData_my = reshape(voiceData_my,1,length(voiceData_my));
phi = ConvFUNC(conj(voiceData_my),cell_array,1/fs_my);

t_n1 = (0:length(n1_ext)-1) / fs_my;
t_phi = (0:length(phi)-1) / fs_my;

figure;
subplot(2, 1, 1);
plot( t_my, voiceData_my);
xlabel('t');
ylabel('Amplitude');
title("Original Voice Record")
grid on;
subplot(2, 1, 2);
plot( t_n1 , n1_ext);
xlabel('t');
ylabel('Amplitude');
title("Extracted Voice Record")
grid on;


phi_amp = abs(phi);

figure;
subplot(1, 3, 1);
plot(t_phi , phi_amp);
xlabel('t');
ylabel('Amplitude');
title("CrossCor Amp")
grid on;

subplot(1, 3, 2);
plot( t_phi , phi_amp.^2);
xlabel('t');
ylabel('Amplitude');
title("CrossCor Amp^2")
grid on;

subplot(1, 3, 3);
plot( t_phi , phi_amp.^4);
xlabel('t');
ylabel('Amplitude');
title("CrossCor Amp^4")
grid on;

[n1, fsx] = audioread('2.flac');%kendi kaydettiğim
t_n1 = 1:length(n1);
t_n1 = t_n1/fsx;

n1_phil = flip(n1);
cell_array = reshape(n1_phil,1,length(n1_phil));
voiceData = reshape(voiceData,1,length(voiceData));
phi = ConvFUNC(conj(voiceData_my),cell_array,1/fsx);
soundsc (phi,fs_my);

phi_amp = abs(phi);
t_phi = (0:length(phi)-1) / fs_my;

figure;
subplot(1, 3, 1);
plot(t_phi , phi_amp);
xlabel('t');
ylabel('Amplitude');
title("CrossCor Amp")
grid on;

subplot(1, 3, 2);
plot( t_phi , phi_amp.^2);
xlabel('t');
ylabel('Amplitude');
title("CrossCor Amp^2")
grid on;

subplot(1, 3, 3);
plot( t_phi , phi_amp.^4);
xlabel('t');
ylabel('Amplitude');
title("CrossCor Amp^4")
grid on;
