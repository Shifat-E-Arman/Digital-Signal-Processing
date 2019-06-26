clear all; close all
%%
dur=3;%disturbing sine wave time duration in sec
f=300;% sine wave frequency
fs=8000;% filter sampling frequency
n=1:3150720; %no of samples
t=n/fs;% no. of samples converted into time in sec
xn=sin(2*pi*f*t);% gen the sine wave with freq f and duration dur
subplot(141)
plot(xn)
xn = xn';
%plot(xn)
sound(xn,fs)%listen to disturbing sine wave
for i = 1:size(xn,1)
    xn(i,2) = xn(i,1);
end
%plot(xn)
noise = xn;
%%
[sounddata, f] = audioread('bird.mp3');
subplot(142)
plot(sounddata)
sound(sounddata,fs)
%%
xplusn=sounddata+xn;
subplot(143)
plot(xplusn)
%sound(xplusn,f)
%%
wo = 60/(300/2);  
bw = wo/35;
[b,a] = iirnotch(wo,bw); % notch filter function is used to get IIR filter coefficients
%[b,a] = butter(2,bw);
%fvtool(b,a);
y=filter(b,a,xplusn);%filter the noisy signal using b and a
%sound(y,fs)%listen to filtered sound
subplot(144)
plot(y);
%%
%orginal sound(sounddata) mixed with un wanted sine xn
w0=f/(fs/2);%w0=notch frequency
bw=w0/30;
[b,a]=iirnotch(w0,bw);% notch filter function is used to get IIR filter coefficients
%[b,a] = butter(2,bw);
y=filter(b,a,xplusn);%filter the noisy signal using b and a
%sound(y,fs)%listen to filtered sound
plot(y)
%%
fs = 20000;             %#sampling rate
f0 = 50;                %#notch frequency
fn = fs/2;              %#Nyquist frequency
freqRatio = f0/fn;      %#ratio of notch freq. to Nyquist freq.

notchWidth = 0.1;       %#width of the notch

%Compute zeros
notchZeros = [exp( sqrt(-1)*pi*freqRatio ), exp( -sqrt(-1)*pi*freqRatio )];

%#Compute poles
notchPoles = (1-notchWidth) * notchZeros;

figure;
zplane(notchZeros.', notchPoles.');

b = poly( notchZeros ); %# Get moving average filter coefficients
a = poly( notchPoles ); %# Get autoregressive filter coefficients

figure;
freqz(b,a,32000,fs)

%filter signal x
y = filter(b,a,xplusn);
plot(y)