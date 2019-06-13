clear; clc;
%% Input Signals
x = [1 1 2 3];
n = [0 1 2 3];

h = [1 2];
m = [-1 0];
%%
[Y N] = convolution(x,n,h,m)
figure
subplot(3,1,1);
stem(Y,N)

[x, n] = zeropad(x,n,N)
stem(n,x);
subplot(3,1,2);

[h,m] = zeropad(h,m,N);
stem(m,h);
subplot(3,1,3);
