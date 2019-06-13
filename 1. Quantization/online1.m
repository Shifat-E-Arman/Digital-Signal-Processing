clear;
%% Data
A=4;
F=pi/2;
theta=0;
Fs=10;
T=1/Fs;
t=0:0.001:2;
nT=0:T:2;
Xt=A*cos(2*pi*F*t+theta);
XnT=A*cos(2*pi*F*nT+theta);
%% Subplot 1
subplot(2,2,1);
plot(t,Xt);
grid;
%% Subplot 2 (Sampling)
subplot(2,2,2);
plot(t,Xt);
hold on
stem(nT,XnT,'Color',[1,0.5,0]);
hold off
title('Sampling')
grid;
%% Subplot 3 (Quantization)
subplot(2,2,3);
[m n]=size(XnT);
XnT_new=round(XnT);
stem(nT,XnT_new,'Color',[0,0.75,0.5]);
hold on
plot(nT,XnT_new,'Color',[0,0.75,0.5]);
hold off
title('Quantization')
grid;
%% Subplot 4 (Quantization Error)
Error=XnT-XnT_new;
subplot(2,2,4);
stem(nT,Error,'Color',[1,0,0.5]);
title('Quantization Error')
grid;