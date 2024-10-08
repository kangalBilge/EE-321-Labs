% Step 1: Set Parameters
M = 100;
c = 0.1;
kappa = 0.1;

% Sampling period and k values
Ts = 1; % Sampling period (s)
k = 30; % Number of coefficients
t = 0:0.001:4;
% Compute the sampled version of x3(t) using the given function
x3_sampled = t.*(t>=0) - (t-3).*(t>=3)- 3 * (t >= 3); % Signal x3(t)

y = zeros(size(t)); % Displacement (initially zero)
y_prev = y; % Previous displacement values
% Step 3: Implement the Discretized Second-Order System
divider = (M/(Ts^2))+(c/Ts) + kappa;
for n = 3:length(t)
    y(n) = ((y(n-1)*(2*M/Ts^2 + c/Ts))-((M/Ts^2)*y(n-2))+x3_sampled(n))/divider;
end

% Step 4: Plot x3[n] and y[n]
figure;
subplot(2,1,1);
plot(t, x3_sampled);
xlabel('Time (s)');
ylabel('x3[n]');
title('Input Signal x3[n]');

subplot(2,1,2);
plot(t, y);
xlabel('Time (s)');
ylabel('y[n]');
title('Output Displacement y[n]');

x3_coefficients = FSAnalysis(x3_sampled, k);
y_coefficients = FSAnalysis(y, k);

% Step 6: Plot Fourier Series Coefficients
figure;
subplot(2,2,1);
stem(-k:k, real(x3_coefficients));
xlabel('k');
ylabel('Real Part');
title('Real Part of Fourier Coefficients of x3[n]');

subplot(2,2,2);
stem(-k:k, imag(x3_coefficients));
xlabel('k');
ylabel('Imaginary Part');
title('Imaginary Part of Fourier Coefficients of x3[n]');

subplot(2,2,3);
stem(-k:k, real(y_coefficients));
xlabel('k');
ylabel('Real Part');
title('Real Part of Fourier Coefficients of y[n]');

subplot(2,2,4);
stem(-k:k, imag(y_coefficients));
xlabel('k');
ylabel('Imaginary Part');
title('Imaginary Part of Fourier Coefficients of y[n]');