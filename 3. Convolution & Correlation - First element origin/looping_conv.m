clear; clc;
%% Input
x = [1  2  1 -1];
h = [1  2  3  1];
%% Padding
%X=[x,zeros(1,length(h))];
%H=[h,zeros(1,length(x))];
%% Looping Convolution
% do we really need to zero pad?
for n=1:length(x)+length(h)-1
    y1(n)=0;
    for k=1:length(x)
       if (n-k+1>0) & (n-k+1<=length(h))
            y1(n)=y1(n)+x(k)*h(n-k+1);
       else
       end
    end
end
stem(y1)
title('Convolution')
%% Looping Correlation
% The only difference is you just have to flip h before entering into the
% loop
h = flip(h)
%H=[h,zeros(1,length(x))];
for n=1:length(x)+length(h)-1
    y2(n)=0;
    for k=1:length(x)
       if (n-k+1>0) & (n-k+1<=length(h))
            y2(n)=y2(n)+x(k)*h(n-k+1);
       else
       end
    end
end
stem(y2)
title('Correlation')