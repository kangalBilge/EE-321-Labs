% Define a simple finite-length signal
n = 0:4; % Time indices
phi1 = ones(size(n)); % Signal phi1[n] = 1 for 0 <= n < 5

% Define the frequency array for the DTFT
w = linspace(-pi, pi, 1000); % Frequency variable from -pi to pi

% Compute the DTFT of the signal
X_phi1 = DTFT(phi1, n, w);

% Compute the IDTFT to recover the time-domain signal
phi2 = IDTFT(X_phi1, n, w);

% Calculate the norm square difference between phi1 and phi2
E = sum(abs(phi1 - phi2).^2);

% Display the error
disp(['Norm square difference (E): ', num2str(E)]);

% Function definitions
function X = DTFT(x, n, w)
    X = sum(x.' .* exp(-1j * n.' * w), 1);
end

function x = IDTFT(X, n, w)
    x = sum(X.' .* exp(1j * w.' * n), 1) * (w(2) - w(1)) / (2 * pi);
end
