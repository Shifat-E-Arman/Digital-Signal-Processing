clc; 
clear;
%% Barker Sequence
BS=[1 1 1 1 1 -1 -1 1 1 -1 1 -1 1];
%% Increase the length of the sequence
for i=1:16
    for j=0:length(BS)-1
        x((j+1)+13*(i-1))=BS(j+1);
    end
end
x=x(1:200);
%% Delay
D= randi([10,20]);
%% Additive noise
a = 0;
b = .01;
v = sqrt(b).*randn(1,200) + a;
for i=1:200
    if i > D 
        Xnd(i-D)=x(i);
    end
end
%% Output
L=length(Xnd);
a=.9;
for i=1:L
    y(i)=a.*Xnd(i)+v(i);
end
%% Fixing the size of output
L1=length(x);
L2=length(y);
 if L1~=L2
     a=L1-L2;
     for i=1:a
         y(L2+i)=0;
     end
 end
 %% Cross Correlation
[r,lag]=xcorr(Xnd,y);
lag1=lag+D;
plot(lag1,r);
title(D);