function [x] = IDTFT(X, n, w)
    x = ((1/(2*pi)) * (exp(1j * w.' * n)).' * X.').'/1000;
end