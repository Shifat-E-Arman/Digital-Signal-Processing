clear;
clc;
%% Data
F1=10;
F2=50;
Fs=40;
T=1/Fs;
%% continuous wave
t=0:0.01:2;
x1=cos(2*pi*F1*t);
x2=cos(2*pi*F2*t);
plot(t,x1,'Color',[1,0.5,0]);
hold on;
xlabel('Time');
ylabel('Amplitude');
plot(t,x2,'Color',[0,0.5,1]);
hold off;
%% sampling
nT=0:T:2;
x1new=cos(2*pi*F1*nT);
x2new=cos(2*pi*F2*nT);
stem(nT,x1new,'Color',[0.5,0.5,0]);
hold on;
stem(nT,x2new,'Color',[0,0.5,0.5]);
hold off;
stem(nT,x1);