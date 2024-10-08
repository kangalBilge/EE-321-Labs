% Sampling period
Ts = 0.01;

% Time vector
n = 0:200; % Assuming 200 samples

% Impulse response h[n]
h = ones(size(n));

% Unit-step response s[n]
s = cumsum(h) * Ts;

% Plot
figure;
subplot(2,1,1);
stem(n, h, 'b', 'LineWidth', 2);
xlabel('Sample (n)');
ylabel('h[n]');
title('Discrete Impulse Response');

subplot(2,1,2);
stem(n, s, 'r', 'LineWidth', 2);
xlabel('Sample (n)');
ylabel('s[n]');
title('Discrete Unit-Step Response');