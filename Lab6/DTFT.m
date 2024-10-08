function [X] = DTFT(x, n, w)
    X = (exp(-1j * w.' * n) * x.').';
end