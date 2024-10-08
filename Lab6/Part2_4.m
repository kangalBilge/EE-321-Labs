
clear;
close all;

x_1 = [2, 4, 6, 8, 7, 6, 5, 4, 3, 2, 1];
x_2 = [1, 2, 1, -1];

nx1 = 0:length(x_1)-1;
nx2 = 0:length(x_2)-1;
ny =  0:length(x_1)+length(x_2)-2;
w = -pi:0.001:pi;

tic;
y1 = ConvFUNC(x_1, x_2, nx1, nx2, ny, w);
time1 = toc;


tic;
y2 = ConvFUNC_M(x_1, x_2);
time2 = toc;

tic;
y3 = conv(x_1, x_2);
time3 = toc;


E1 = norm(y3 - y1)^2;
E2 = norm(y3 - y2)^2;
E3 = norm(y1 - y2)^2;


disp('Elapsed time for ConvFUNC:');
disp(time1);
disp('Elapsed time for ConvFUNC_M:');
disp(time2);
disp('Elapsed time for MATLAB conv function:');
disp(time3);

disp('Norm square difference (E1) between ConvFUNC and MATLAB conv function:');
disp(E1);
disp('Norm square difference (E2) between ConvFUNC_M and MATLAB conv function:');
disp(E2);
disp('Norm square difference (E3) between ConvFUNC and ConvFUNC_M:');
disp(E3);
