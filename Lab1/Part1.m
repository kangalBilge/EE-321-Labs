
f_0 = 440; % Given frequency of the signal
end_time = 3; % time-lenth of the signal
f_sample = 10000; % Sampling rate (1/T_sample)


t = linspace(0, end_time, end_time*f_sample); %sampling array


x1 = sin(2*pi*f_0*t);
x_12 = sin(2*pi*2*f_0*t);
x_13 = sin(2*pi*4*f_0*t);


figure;

subplot(3,1,1);
plot(t, x1);
xlim([0,0.01]);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Signal with frequency:440 Hz');
grid on;

subplot(3,1,2);
plot(t, x_12);
xlim([0,0.01]);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Signal with frequency 880Hz');
grid on;

subplot(3,1,3);
plot(t, x_13);
xlim([0,0.01]);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Signal with frequency 1760Hz');
grid on;


soundsc(x1, f_sample);
pause(end_time);
soundsc(x_12, f_sample);
pause(end_time);
soundsc(x_13, f_sample);
pause(end_time);

% Major triad formula 
s = sin(2*pi*440*t) + sin(2*pi*554*t) + sin(2*pi*659*t);

figure;
plot(t, s);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Major Triad - A, C#, E');
grid on;

soundsc(s, f_sample);