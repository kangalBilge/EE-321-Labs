function y = ConvFUNC(x, h, nx, nh, ny, w)
    y = ifft(fft(x, ny) .* fft(h, ny));
end
