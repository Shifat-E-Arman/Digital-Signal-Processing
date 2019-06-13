function [YY, NN] = convolution(x,n,h,m)
    strt = min(min(n),min(m));
    NN = strt:strt + length(n)+ length(m) - 2;
    
[h1,m1] = fold(h,m);
[h1,m1] = shift(h1,m1,-m(1));

t = m(1);

N = min(n) - length(m)+1:max(n)+length(m)-1;
[x1,n1] = zeropad(x,n,N);

for i=1:length(m) + length(n)-1
    [h1,m1] = zeropad(h1,m1,N);
    y(i) = sum(x1.*n1);
    [h1,m1] = shift(h1,n1,-1);
end
YY = y;
end