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

omega_pass = 50;
%
x1 = cos(2*pi*f1*t) .* rectpuls(t , T);
x2 = cos(2*pi*f2*t) .* rectpuls(t , T);
%

%Time delay calculation for cosine signals of x1 and x2
read1_1 = cos(2*pi*f1*t) .*exp(-1i*2*pi*f1*(2*d1/c)).* rectpuls(t - 2*d1/c, T);
read1_2 = cos(2*pi*f2*t) .*exp(-1i*2*pi*f2*((d1+d2)/c)).*rectpuls(t - (d1+d2)/c, T);
read2_1 = cos(2*pi*f1*t) .*exp(-1i*2*pi*f1*((d1+d2)/c)).*rectpuls(t - (d1+d2)/c, T);
read2_2 = cos(2*pi*f2*t) .*exp(-1i*2*pi*f2*(2*d2/c)).*rectpuls(t - 2*d2/c, T);
r1 = read1_1 + read1_2 ;
r2 = read2_1 + read2_2;
 

X1 = FourierTransform(x1, t, Ts);
X2 = FourierTransform(x2, t, Ts);
R1 = FourierTransform(r1, t, Ts);
R2 = FourierTransform(r2, t, Ts);

% Appllication of band-pass filters
Y1 = R1 .* ((abs(frequency_array - f1) <= omega_pass/2)+(abs(frequency_array + f1) <= omega_pass/2));
Y2 = R2 .* ((abs(frequency_array - f2) <= omega_pass/2)+(abs(frequency_array + f2) <= omega_pass/2));
% % 
% figure
%  subplot(4,1,1)
%  stem(t, x1);
%  grid on;
%  xlabel('frequency');
%  ylabel('Fourier Transform');
%  title('Fourier Transform of the Signal');
%  subplot(4,1,2)
%  stem(t, x2);
%  grid on;
%  xlabel('frequency');
%  ylabel('Fourier Transform');
%  title('Fourier Transform of the Signal');
%  subplot(4,1,3)
%  stem(t, r1);
%  grid on;
%  xlabel('frequency');
%  ylabel('Fourier Transform');
%  title('Fourier Transform of the Signal');
%  subplot(4,1,4)
%  stem(t, r1);
%  grid on;
%  xlabel('frequency');
%  ylabel('Fourier Transform');
%  title('Fourier Transform of the Signal');

figure;
subplot(4,1,1);
plot(t, x1);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('x1(t)');
subplot(4,1,2);
plot(t, x2);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('x2(t)');
subplot(4,1,3);
plot(t, r1);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('r1(t)');
subplot(4,1,4);
plot(t, r2);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('r2(t)');
 
 % Plot magnitude of Fourier transforms
 figure
 subplot(1,2,1);
 plot(frequency_array, abs(R1), 'r');
 hold on;
 plot(frequency_array, abs(X1), 'b');
 hold off;
 title('|X1(jω)| and |R1(jω)|');
 legend('R1(jω)', 'X1(jω)');
 subplot(1,2,2);
 plot(frequency_array, abs(R2), 'r');
 hold on;
 plot(frequency_array, abs(X2), 'b');
 hold off;
 title('|X2(jω)| and |R2(jω)|');
 legend('R2(jω)','X2(jω)');
 
 % Plots of the filtered signals
 figure
 subplot(2,1,1);
 plot(frequency_array, abs(Y1));
 grid on;
 title('|Y1(jω)|');
 subplot(2,1,2);
 plot(frequency_array, abs(Y2));
 grid on;
 title('|Y2(jω)|');
 
  % Distance estimation part
  [~, index_f1] = min(abs(frequency_array - f1));
  [~, index_f2] = min(abs(frequency_array - f2));
  phase_f1 = angle(Y1(index_f1));
  phase_f2 = angle(Y2(index_f2));
  d1_estimate = abs((phase_f1 * c) / (2*pi*f1))/2;
  d2_estimate = abs((phase_f2 * c) / (2*pi*f2))/2;
  disp(['Estimated d1: ', num2str(d1_estimate), ' m']);
  disp(['Estimated d2: ', num2str(d2_estimate), ' m']);