% Define test signals
x = [1, 2, 3, 4];
h = [1, 0, -1];

% Compute convolution
y = ConvFUNC(x, h, 1:length(x), 1:length(h), length(x) + length(h) - 1, []);

% Display the result
disp('Convolution Result:');
disp(y);
