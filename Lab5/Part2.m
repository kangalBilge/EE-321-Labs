Ts = 0.01;
Fs = 1 / Ts;
t = -10:Ts:10;
frequency = linspace(-Fs/2, Fs/2, length(t));
x = cos(60*pi*t);
X = FourierTransform(x,t,Ts);

figure;
plot(frequency, X);
xlim([-60 60])
ylim([-0.1 0.7])
grid on;
xlabel('frequency');
ylabel('Fourier Transform');
title('Fourier Transform of the Signal');
