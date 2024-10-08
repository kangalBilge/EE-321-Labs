w = 0:1:1000;
formula = abs(exp(-1i*2*pi*w/100));
stem(w,formula)