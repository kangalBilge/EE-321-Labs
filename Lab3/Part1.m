Ts = 0.01;

n = 0:Ts:2; % Adjusted for 201 samples

% Impulse response h[n]
h = zeros(size(n));
h(1) = 1/Ts;

% Unit-step response s[n] for the impulse input
s = cumsum(h)*Ts;

% Ramp response s[n] for the unit-step input
r = cumsum(s)*Ts;

imp_resp = conv(exp(-1*n),h,"same")*Ts;
us_resp = conv(exp(-1*n),s,"same")*Ts;
exp_imp = cumsum(imp_resp)*Ts;
exp_us = cumsum(us_resp)*Ts;


% Plotss
figure;
subplot(5,1,1);
stem(n, h, 'b' );
xlabel('Sample (n)');
ylabel('h[n]');
title('Discrete Impulse Response');

subplot(5,1,2);
stem(n, s, 'b');
xlabel('Sample (n)');
ylabel('s[n]');
title('Discrete Unit-Step Response');

subplot(5,1,3);
stem(n, r, 'b');
xlabel('Sample (n)');
ylabel('r[n]');
title('Discrete Ramp Response');

subplot(5,1,4);
stem(n, exp_imp, 'r');
xlabel('Sample (n)');
ylabel('e[n]');
title('Discrete Exponential Decaying Impulse Response');
subplot(5,1,5);
stem(n, exp_us, 'r');
xlabel('Sample (n)');
ylabel('e[n]');
title('Discrete Exponential Decaying Unit-Step Response');