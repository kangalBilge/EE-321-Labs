x = [0,0,1,1,1,0,0,0,1,1,1,0];
h = [0,0,1,1,1,0,0,0,1,1,1,0];
y = ConvFUNC(x,x);

subplot(3, 1, 1);
stem(0:length(x)-1, x);
ylim([-0.1,1.1])
xlabel('n');
ylabel('x[n]');
title('Sequence x[n]');

subplot(3, 1, 2);
stem(0:length(h)-1, h);
ylim([-0.1,1.1])
xlabel('n');
ylabel('h[n]');
title('Sequence h[n]');

subplot(3, 1, 3);
stem(0:length(y)-1, y);
ylim([-0.5,6.5])
xlabel('n');
ylabel('y[n]');
title('Sequence y[n]');