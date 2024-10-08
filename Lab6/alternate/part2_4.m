% Clear workspace and close all figures
clear;
close all;

% Define test signals
x1 = [2, 4, 6, 8, 7, 6, 5, 4, 3, 2, 1];
x2 = [1, 2, 1, -1];

% Compute convolution using the built-in function
tic;
y3 = conv(x1, x2);
t3 = toc;

% Ensure y3 is a row vector
y3 = y3(:).';

% Compute convolution using the custom function (Fourier based)
tic;
y1 = ConvFUNC(x1, x2, 1:length(x1), 1:length(x2), length(x1) + length(x2) - 1, []);
t1 = toc;

% Ensure y1 is a row vector
y1 = y1(:).';

% Compute convolution using the custom function (Matrix based)
tic;
y2 = ConvFUNC_M(x1, x2);
t2 = toc;

% Ensure y2 is a row vector
y2 = y2(:).';

% Display results
disp(['Built-in conv() output: ', num2str(y3)]);
disp(['ConvFUNC output: ', num2str(y1)]);
disp(['ConvFUNC_M output: ', num2str(y2)]);

% Compare results
e1 = sum((y1 - y3).^2);
e2 = sum((y2 - y3).^2);
e3 = sum((y1 - y2).^2);  % Error between the two custom functions

disp(['Error between ConvFUNC and conv(): ', num2str(e1)]);
disp(['Error between ConvFUNC_M and conv(): ', num2str(e2)]);
disp(['Error between ConvFUNC and ConvFUNC_M: ', num2str(e3)]);

% Display computation times
disp(['Time for built-in conv(): ', num2str(t3), ' seconds']);
disp(['Time for ConvFUNC: ', num2str(t1), ' seconds']);
disp(['Time for ConvFUNC_M: ', num2str(t2), ' seconds']);
