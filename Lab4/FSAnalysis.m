function [fsCoeffs] = FSAnalysis(x, k)

    N = length(x);
    fsCoeffs = zeros(2*k + 1, 1);
    for n = 1:N
        for m = -k:k
            fsCoeffs(m+k+1) = fsCoeffs(m+k+1) + (1/N) * x(n) * exp(-1i * m * 2*pi/N * (n-1));
        end
    end
end
