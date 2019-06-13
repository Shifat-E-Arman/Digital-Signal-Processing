clear; clc;
%% Continuous Time Signal
A=4;
F=pi/2;
theta=0;
Fs=10;
T=1/Fs;
t=0:0.001:2;
Xt=A*cos(2*pi*F*t+theta);
subplot(2,2,1)
plot(t,Xt)
xlabel('Time');
ylabel('Amplitude');
title('Continuous Time Signal')
grid
%% Sampling - Discrete Time Signal
nT=0:T:2;
XnT=A*cos(2*pi*F*nT+theta);
subplot(2,2,2)
stem(nT,XnT)
xlabel('Time');
ylabel('Amplitude');
title('Sampling - DTS')
grid
%% Quantization - Discrete Time Discete Valued Signal
[m n] = size(XnT);
for i=1:n
    XnT_new = round(XnT);
end
subplot(2,2,3)
stem(nT,XnT_new)
xlabel('Time');
ylabel('Amplitude');
title('Quantization - Discrete Time Discete Valued Signal')
grid
%% Quantization Error
for i=1:n
    error = XnT - XnT_new;
end
subplot(2,2,4)
stem(nT,error)
xlabel('time')
ylabel('error')
title('Quantization Error')
grid
%% Output