function [y] = ConvFUNC(x, h, int_length)
    if nargin < 3 || isempty(int_length)
        int_length = 1; % Set your default value here
    end
    Nx = length(x);
    Nh = length(h);
    Ny = Nx + Nh - 1;
    y = zeros(1, Ny);
    concX = zeros(1,Ny-Nx);
    concX2 = zeros(1,Ny-Nx-1);
    X=[concX,x,concX];
    for n = 1:Ny
        conv_1 = X(n:n+Nh-1);
        conv_2 = flip(h);
        y(n) = int_length * dot(conv_1,conv_2);
    end
end