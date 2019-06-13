clear; clc;
%% Input
L = 200;
K = 50;
x = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
%x = [1  2  1 -1];
%% b_1
h = [0.1];
yb_1 = myconv(x,h)
subplot(121)
stem(yb_1)
title('Implemented function')
%% b_2
yb_2 = conv(x,h)
subplot(122)
stem(yb_2)
title('Built-in function')
%% c
for n = 0:14
    h(n+1) = 0.25*(.75)^n
end
subplot(111)
yc = myconv(x,h)
stem(yc)