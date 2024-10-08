f1 = 100;    
f2 = 800;    
Ts = 0.0001;    
Fs = 1/Ts;
t = 0:Ts:2;
% t1= t + 2*d1/c;
% t2= t + (d1+d2)/c;
% t3= t + 2*d2/c;
frequency_array = linspace(-Fs/2, Fs/2, length(t));
d1 = 0.05;   
d2 = 0.1;    
c = 343;     
T = 2;       
v1 = -30;
v2 = 40;
omega_pass = 50;
%
x1 = cos(2*pi*f1*t) .* rectpuls(t , T);
x2 = cos(2*pi*f2*t) .* rectpuls(t , T);
%
scale1 = (c+v1)/(c-v1);
scale2 = (c+v1)/(c-v2);
scale3 = (c+v2)/(c-v1);
scale4 = (c+v2)/(c-v2);
%Implementing the Doppler Effect received signals
read1_1 = cos(2*pi*f1*t*scale1) .*exp(-1i*2*pi*f1*(2*d1/c)).* rectpuls(t - 2*d1/c, T);
read1_2 = cos(2*pi*f2*t*scale2) .*exp(-1i*2*pi*f2*((d1+d2)/c)).*rectpuls(t - (d1+d2)/c, T);
read2_1 = cos(2*pi*f1*t*scale3) .*exp(-1i*2*pi*f1*((d1+d2)/c)).*rectpuls(t - (d1+d2)/c, T);
read2_2 = cos(2*pi*f2*t*scale4) .*exp(-1i*2*pi*f2*(2*d2/c)).*rectpuls(t - 2*d2/c, T);
r1_doppler = read1_1 + read1_2 ;
r2_doppler = read2_1 + read2_2;


% Fourier Transform of received signals

R1_doppler = FourierTransform(r1_doppler, t, Ts);
R2_doppler = FourierTransform(r2_doppler, t, Ts);

figure;
subplot(2,1,1);
plot(frequency_array, abs(X1), 'b');
hold on;
plot(frequency_array, abs(R1_doppler), 'r');
hold off;
title('|X1(jω)| and |R1(jω)| with Doppler effect');
legend('X1(jω)', 'R1(jω)');
subplot(2,1,2);
plot(frequency_array, abs(X2), 'b');
hold on;
plot(frequency_array, abs(R2_doppler), 'r');
hold off;
title('|X2(jω)| and |R2(jω)| with Doppler effect');
legend('X2(jω)', 'R2(jω)');

% Finding the peaks of the signals
[~, index_f1_peak] = max(abs(X1));
[~, index_R1_peak] = max(abs(R1_doppler));
[~, index_f2_peak] = max(abs(X2));
[~, index_R2_peak] = max(abs(R2_doppler));

% Scaling factor derivation
scaling_factor1 = 84 / 100;
scaling_factor2 = 1011 / 800;
% scaling_factor1 = 0.84;
% scaling_factor2 = 1.27;
% Estimation of the velocities
v1_estimate = c * (scaling_factor1 - 1) / (scaling_factor1 + 1);
v2_estimate = c * (scaling_factor2 - 1) / (scaling_factor2 + 1);
disp(['Estimated v1: ', num2str(v1_estimate), ' m/s']);
disp(['Estimated v2: ', num2str(v2_estimate), ' m/s']);
