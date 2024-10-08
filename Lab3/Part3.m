n = 0:50; 
x1 = 8*(double(n>=0)-double(n>=4)) - 4*(double(n>=4)-double(n>=13));
x2 = 0.3.^n .* double(n>=0);
a_values = [0, 0.05, 0.1, 0.25, 0.5];
y1_ideal = conv(x1,double(n>=0));
y2_ideal = conv(x2,double(n>=0));
n_new = 1:length(y1_ideal);
figure;
subplot(2,1,1)
stem(n_new,y1_ideal)
title("X_1 Integrated over n");
xlabel('n');
ylabel('Y_1 ideal');
subplot(2,1,2)
stem(n_new,y2_ideal)
title("X_2 Integrated over n");
xlabel('n');
ylabel('Y_2 ideal');
y1 = zeros(length(a_values), 2*length(n)-1);
y2 = zeros(length(a_values), 2*length(n)-1);
for i = 1:length(a_values)
    a = a_values(i);
    exp_current = exp(-a*n); % Modify impulse response for current 'a'
    y1(i, :) = conv(x1, exp_current);
    y2(i, :) = conv(x2, exp_current);
end
E1 = zeros(size(y1));
E2 = zeros(size(y2));
for i = 1:length(a_values)
    E1(i, :) = abs(y1_ideal - y1(i, :));
    E2(i, :) = abs(y2_ideal - y2(i, :));
end

for i = 1:length(a_values)
    figure;
    subplot(2, 1, 1);
    stem(n_new, E1(i, :), 'filled');
    title(['Difference E1, a = ' num2str(a_values(i))]);
    xlabel('n');
    ylabel('E1[n]');
    
    subplot(2, 1, 2);
    stem(n_new, E2(i, :), 'filled');
    title(['Difference E2, a = ' num2str(a_values(i))]);
    xlabel('n');
    ylabel('E2[n]');
end