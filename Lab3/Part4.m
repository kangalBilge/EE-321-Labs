h = [zeros(1,2),1, zeros(1, 50)];
hsec_order = zeros(size(h));
for n = 3:length(h)
    hsec_order(n) = h(n) - 2*h(n-1) + h(n-2);
end
% Plot impulse response
stem(-2:3, hsec_order(1:6));
xlabel('n');
ylabel('Impulse Response');
title('Impulse Response of the Second-Order Differentiator');

% Investigate BIBO stability
figure;
N_range = 0:5;
sum_array = sumElements([zeros(1,length(hsec_order)-1),hsec_order], N_range);
stem(N_range, sum_array);
xlabel('N');
ylabel('Summation Value');
title('BIBO Stability Analysis');

n = 0:50; 
x1 = 8*(double(n>=0)-double(n>=4)) - 4*(double(n>=4)-double(n>=13));
x2 = 0.3.^n .* double(n>=0);
x1sec_order = zeros(size(x1));
x2sec_order = zeros(size(x2));
for n = 3:length(x1)
    x1sec_order(n) = x1(n) - 2*x1(n-1) + x1(n-2);
    x2sec_order(n) = x2(n) - 2*x2(n-1) + x2(n-2);
end
figure
subplot(2,1,1)
stem(0:length(x1sec_order)-1, x1sec_order);
xlabel('n');
ylabel('X_1''');
title('Second order derivative approximation of X_1');
subplot(2,1,2)
stem(0:length(x2sec_order)-1, x2sec_order);
xlabel('n');
ylabel('X_2''');
title('Second order derivative approximation of X_2');

x1_inversed = Inverse_2ndOrd(x1sec_order);
figure;
subplot(2,1,1)
stem(0:length(x1_inversed)-1, x1_inversed);
xlabel('n');
ylabel('X_1');
title('Signal obtained after inverse operation of X_1''');

x2_inversed = Inverse_2ndOrd(x2sec_order);
subplot(2,1,2)
stem(0:length(x2_inversed)-1, x2_inversed);
xlabel('n');
ylabel('X_2');
title('Signal obtained after inverse operation of X_2''');
