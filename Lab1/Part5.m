
duration = [2, 2, 3]; 
f_sample = 10000; 
starting_frequency = [2500, 500, 3000]; 
ending_frequency = [500, 2500, -2000]; 
x_start = [0, 1.7, 0]; 
x_end = [0.3, 2, 2]; 
% Calculate the mu array based on the duration and frequency change
mu = (ending_frequency - starting_frequency) ./ (duration.^2);
figure;
for i= 1:3
    t = linspace(0, duration(i), duration(i)*f_sample);
    x5 = cos(2*pi*mu(i)*t.^2 + 2*pi*starting_frequency(i)*t);
    subplot(length(duration), 1, i);
    plot(t, x5);
    xlim([x_start(i),x_end(i)])
    ylim([-1,1])
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    title(['Chirp Signal - Starting at ', num2str(starting_frequency(i)),' Ending at ',num2str(ending_frequency(i))]);
    grid on;
    soundsc(x5, f_sample);
    pause(2)
end
