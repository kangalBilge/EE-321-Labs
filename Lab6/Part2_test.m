n = 0:4;
phi = double(n>=0 & n<5);
w = -pi:0.001:pi;
Phi = DTFT(phi,n,w);
phi_ift=IDTFT(Phi,n,w);
E = norm(phi - phi_ift)^2;
disp("Error:");
disp(E);