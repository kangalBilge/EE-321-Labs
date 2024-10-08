function [frequency_array] = FourierTransform(x, t, Ts)

    N = length(x);
    Fs = 1 / Ts;

    frequency = linspace(-Fs/2, Fs/2, N);
    frequency_array = zeros(1,N);
    for k = 1:length(frequency_array)
        sum_value = 0;
        for n = 1:N
            sum_value = sum_value + x(n) * exp(-1i * 2 * pi * frequency(k) * t(n));
        end
        frequency_array(k) = sum_value/(N+1);
    end
end
