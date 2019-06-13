clear; clc;
%% Folding
x = [1  2  1  -1]
h1 = [1  2  3   1]
lenx=length(x);
lenh1=length(h1);
h2 = h1; 
for i = 1:lenh1
    h2(i) = h1(4-i+1)
end
y = x.*h2
y0 = sum(x.*h2)


 


















