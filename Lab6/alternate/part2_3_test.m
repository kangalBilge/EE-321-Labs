% Define test signals
x = [1, 2, 3, 4];
h = [1, 0, -1];

% Compute convolution using the custom function
y = ConvFUNC_M(x, h);

% Display the result
disp('Convolution Result:');
disp(y);
