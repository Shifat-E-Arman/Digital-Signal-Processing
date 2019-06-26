clear;clc;close all;
n=0:200;
M=100; % Size of window

w1 = 0.05*pi;
w2 = 0.20*pi;
w3 = 0.35*pi;
wa = 0.15*pi;
wb = 0.25*pi;
s = sin(w2*n); %signal
v1 = sin(w1*n); %Noise part 1
v2 = sin(w3*n); %Noise part 2

v = v1+v2; % Total Noise
x = s+v; % Polluted signal x(n)

w = 0.54 - 0.46.*cos((2*pi).*n/M); % Window Function
h = (w/pi).*(wb.*sinc((wb/pi).*(n-M/2)) - wa.*sinc((wa/pi).*(n-M/2))); % Filter

y = filter(h,1,x); %Filtered Signal

%% plot signal and noisy signal
figure; plot(n,x);
hold on; 
plot(n,s);
title('x(n) and s(n)');
hold off;

%% plot filtered signal 
figure ; 
plot(n,s);
hold on;
plot(n,y);
title('s(n) and filtered x(n)');
hold off;

%% plot filtered noise and noise signal only
figure ; 
plot(n,v);
hold on;
plot(n,filter(h,1,v));
title('v(n) and filtered v(n)');
hold off;

%% Plot frequency response of filter
firFilt = dsp.FIRFilter('Numerator',h);
[H,omega]=freqz(firFilt);

figure; plot(omega,abs(H));
title('Magnitude response of filter');
xlim([0,0.4*pi]);
xticks([0 0.05*pi 0.1*pi 0.15*pi 0.20*pi 0.25*pi 0.30*pi 0.35*pi 0.4*pi])
xticklabels({'0','\omega_1','0.1\pi','0.15\pi','\omega_2','0.25\pi','0.3\pi','\omega_3','0.4\pi'})




