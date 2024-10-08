f1_values = [10, 5, 15]; % Array of low-frequencies
f2 = 1000; % High-frequency signal
duration = 3; 
f_sample = 10000; 


t = linspace(0, duration, duration*f_sample);

figure;
for i = 1:length(f1_values)
    f1 = f1_values(i);
    x4 = cos(2*pi*f1*t) .* cos(2*pi*f2*t);
    % Plot x4
    subplot(length(f1_values), 1, i);
    plot(t, x4);
    xlim([0,0.3]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Signal x4(t) - f1 = ', num2str(f1)]);
    grid on;
    
    % Listen to x4
    soundsc(x4, f_sample);
    pause(duration);
end