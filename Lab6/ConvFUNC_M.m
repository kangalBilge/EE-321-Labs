function [y] = ConvFUNC_M(x,h)
     M = toeplitz([h(1) zeros(1, length(x) - 1)], [h zeros(1, length(x) - 1)]);
     y = x* M;
end