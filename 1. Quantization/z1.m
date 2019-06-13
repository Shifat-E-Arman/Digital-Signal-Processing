clear all; clc;
A=15;
%F=input('Enter the frequency \n');
Fs=input('Enter sampling frequency \n');
Ts=1/Fs;
t=[-1:.001:1];
T=[-1:Ts:1];
X=A*cos(2*pi*10*T+.5*pi);
Y=A*cos(2*pi*50*T);
title('sinusoidal signal');
stem(T,X,'r'); hold on;
stem(T,Y);
ylabel('Amplitute');
xlabel('Time');


