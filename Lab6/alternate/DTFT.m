function X = DTFT(x, n, w)
    % Ensure 'n' is a column and 'w' is a row before the operation
    X = sum(x.' .* exp(-1j * n.' * w), 1);  % Correct dimension handling
end
