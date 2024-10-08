% Small test signal
x_test = rand(1, 100);  % Small random signal
n_test = 0:length(x_test)-1;  % Corresponding indices
w_test = linspace(-pi, pi, length(n_test));  % Frequency vector

% Compute DTFT
X_test = DTFT(x_test, n_test, w_test);

% Check the output
disp(X_test);
