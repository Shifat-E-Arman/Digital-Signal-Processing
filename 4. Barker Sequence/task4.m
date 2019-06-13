clc;
clear;
%% Barker Sequence
x = [1 1 1 1 1 -1 -1 1 1 -1 1 -1 1];
%% Increase the length of the sequence
for i = 1:16
    for j = 0:length(x)-1
        x((j+1)+13*(i-1))=x(j+1);
    end
end
x = x(1:200); % resizing x
%% Delay
D = randi([10,20]); % random delay
for i = 1:200
    if i>D
        xd(i-D)=x(i);
    end
end
%% Additive noise
mean= 0; variance = .01;
v = sqrt(variance).*randn(1,200)+1; % additive noise
%% Output
L = length(xd);
a = 0.9;
for i=1:L
    y(i) = a.*xd(i)+v(i);
end
%% Fixing the size of output
% Making the size of y 200
len1 = length(x);
len2 = length(y);
if len1~=len2
    a = len1-len2;
    for i = 1:a
        y(len2+i) =0;
    end
end
%% Cross Correlation
[r, lag] = xcorr(xd,y);
% r is the cross-correlation or auto-correlation returned as vector or matrix
% lag is lag indices returned as vector
lagD=lag+D;
plot(lagD,r)
title(D);
%%
clc; clear; close all;

%generating input signal
origin=1;
x = [1 1 1 1 1 -1 -1 1 1 -1 1 -1 1];
x = [x x x x x x x x x x x x x x x 1 1 1 1 1];
Xn = 0:199;

% Definitions
a = 0.85;
D=round(random('Uniform',10,20));
v = random('Normal' , 0, 0.1, [1 200]);

% generating output signal
[x,xn] =shift(x,Xn,D); 
y = a*x + v;
yn = xn;

% cross correlate x,y
[rxy,lag] = ccor(x,Xn,y,yn);

% Find index of peak
[M, midx] = max(rxy);
lag(midx)

% plot the correlated signal
stem(lag,rxy,'k*');