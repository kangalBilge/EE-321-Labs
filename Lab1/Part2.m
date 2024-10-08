f_0 = 587; 
duration = 3; 
f_sample = 1/0.0001; 

%sampling array
t = linspace(0, duration, duration*f_sample);

% Sinusoidal signals with the given phases
phases = [0, pi/4, pi/2, 3*pi/4, pi];
x2_phasevar_signals = zeros(length(phases), length(t));

for i = 1:length(phases)
    x2_phasevar_signals(i, :) = cos(2*pi*f_0*t + phases(i));
end


figure;
for i = 1:length(phases)
    subplot(length(phases), 1, i);
    plot(t, x2_phasevar_signals(i, :));
    xlim([0,0.01]);
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    title(['x2(t) with respect to Phase = ', num2str(phases(i)), ' rad']);
    grid on;
end

% Listen to the signals
for i = 1:length(phases)
    soundsc(x2_phasevar_signals(i, :), f_sample);
    pause(duration);
end