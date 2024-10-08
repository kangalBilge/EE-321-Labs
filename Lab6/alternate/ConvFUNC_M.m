function y = ConvFUNC_M(x, h)
    % Construct the Toeplitz matrix for the convolution
    T = toeplitz([h(:); zeros(length(x)-1, 1)], [h(1), zeros(1, length(x)-1)]);
    
    % Perform the matrix multiplication to get the convolution result
    y = T * x(:);
end
