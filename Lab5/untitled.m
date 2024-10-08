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
%Time delay for cosine signals of x1 and x2
read1_1 = cos(2*pi*f1*t*(c+v1)/(c-v1)) .*exp(-1i*2*pi*f1*(2*d1/c)).* rectpuls(t - 2*d1/c, T);
read1_2 = cos(2*pi*f2*t) .*exp(-1i*2*pi*f2*((d1+d2)/c)).*rectpuls(t - (d1+d2)/c, T);
read2_1 = cos(2*pi*f1*t) .*exp(-1i*2*pi*f1*((d1+d2)/c)).*rectpuls(t - (d1+d2)/c, T);
read2_2 = cos(2*pi*f2*t) .*exp(-1i*2*pi*f2*(2*d2/c)).*rectpuls(t - 2*d2/c, T);
r1 = read1_1 + read1_2 ;
r2 = read2_1 + read2_2;
