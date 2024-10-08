a_values = [2, 1, 3]; % Array of exponent coefficients
f_0 = 440; 
duration = 3; 
f_sample = 10000; 

% Generate time vector
t = linspace(0, duration, duration*f_sample);

% Compute x3 for each value of a
figure;
for i = 1:length(a_values)
    a = a_values(i);
    %Element-wise multiplication with arrays
    x3 = exp(-(a^2 + 2) * t) .* cos(2*pi*f_0*t); 
    
    subplot(length(a_values), 1, i);
    plot(t, x3);
    xlim([0,3]);
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    title(['Signal x3(t) with varying a = ', num2str(a)]);
    grid on;
    
    
    soundsc(x3, f_sample);
    pause(duration);
end