x = [1, 2, 1, -1];
y = x.'*x;
matr=spdiags(y, -1:1, 4,4);