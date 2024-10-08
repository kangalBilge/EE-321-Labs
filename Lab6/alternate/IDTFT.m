function x = IDTFT(X, n, w)
    x = sum(X.' .* exp(1j * w.' * n), 2) * (w(2) - w(1)) / (2 * pi);  % Maintaining vectorization
end

