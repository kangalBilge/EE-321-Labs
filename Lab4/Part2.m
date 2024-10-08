Ts = 0.001; % Sampling period
% Define the signal x3(t)
t = 0:Ts:4; % Time vector
x3_t = t.*(t>=0) - (t-3).*(t>=3)- 3 * (t >= 3); % Signal x3(t)

% Compute the Fourier series coefficients of x3(t)

k = 30; % Number of coefficients
fsCoeffs_x3 = FSAnalysis(x3_t, k);

% Plot the real and imaginary parts of the Fourier series coefficients of x3(t)
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_x3), 'b', 'LineWidth', 1.5);
xlabel('k');
ylabel('Real part');
title('Real part of Fourier Series Coefficients of x3(t)');

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_x3), 'r', 'LineWidth', 1.5);
xlabel('k');
ylabel('Imaginary part');
title('Imaginary part of Fourier Series Coefficients of x3(t)');
%--------------------------------------------------------
t1 = -4:Ts:0;
z1 =  - (t-1).*(t1>=-3) + 3 * (t1 >= -3);
fsCoeffs_z1 = FSAnalysis(z1, k);

figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z1), 'b', 'LineWidth', 1.5);
xlabel('k');
ylabel('Real part');
title('Real part of Fourier Series Coefficients of z1(t)');

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z1), 'r', 'LineWidth', 1.5);
xlabel('k');
ylabel('Imaginary part');
title('Imaginary part of Fourier Series Coefficients of z1(t)');
%--------------------------------------------------------
z2 = 1*(t>=0) - 1*(t>=3)- 3 * (t == 0)/Ts;
fsCoeffs_z2 = FSAnalysis(z2, k);

figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z2), 'b', 'LineWidth', 1.5);
xlabel('k');
ylabel('Real part');
title('Real part of Fourier Series Coefficients of z2(t)');

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z2), 'r', 'LineWidth', 1.5);
xlabel('k');
ylabel('Imaginary part');
title('Imaginary part of Fourier Series Coefficients of z2(t)');
%--------------------------------------------------------
t3 = t-2;
z3 = (t).*(t3>=-2) - (t-3).*(t3>=1)- 3 * (t3 >= 1);
fsCoeffs_z3 = FSAnalysis(z3, k);

figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z3), 'b', 'LineWidth', 1.5);
xlabel('k');
ylabel('Real part');
title('Real part of Fourier Series Coefficients of z3(t)');

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z3), 'r', 'LineWidth', 1.5);
xlabel('k');
ylabel('Imaginary part');
title('Imaginary part of Fourier Series Coefficients of z3(t)');
%--------------------------------------------------------
tBack = -4:Ts:0;
z4 = (1/2)*( t.*(t>=0) - (t-3).*(t>=3)- 3 * (t >= 3) + flip(t.*(tBack>=-4) - (t-3).*(tBack>=-1)- 3 * (tBack >= -1)) );
fsCoeffs_z4 = FSAnalysis(z4, k);

figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z4), 'b', 'LineWidth', 1.5);
xlabel('k');
ylabel('Real part');
title('Real part of Fourier Series Coefficients of z4(t)');
    
    subplot(2, 1, 2);
    stem(-k:k, imag(fsCoeffs_z4), 'r', 'LineWidth', 1.5);
    xlabel('k');
    ylabel('Imaginary part');
    title('Imaginary part of Fourier Series Coefficients of z4(t)');
%--------------------------------------------------------
z5 = x3_t.*x3_t;
fsCoeffs_z5 = FSAnalysis(z5, k);

% Plot the real and imaginary parts of the Fourier series coefficients of x3(t)
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z5), 'b', 'LineWidth', 1.5);
xlabel('k');
ylabel('Real part');
title('Real part of Fourier Series Coefficients of z5(t)');

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z5), 'r', 'LineWidth', 1.5);
xlabel('k');
ylabel('Imaginary part');
title('Imaginary part of Fourier Series Coefficients of z5(t)');
%--------------------------------------------------------
