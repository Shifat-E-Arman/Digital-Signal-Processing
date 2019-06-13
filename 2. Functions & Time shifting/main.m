clear;
clc;
t = [-10:1:10];
%% Unit Impulse
impulse = t == 0;
subplot(1,3,1);
stem(t,impulse)
%% Unit Step
unitstep = t >= 0
subplot(1,3,2);
stem(t,unitstep)
%% Unit Ramp
unitramp = t .* unitstep;
subplot(1,3,3)
stem(t,unitramp)
%% Exponential
subplot(2,2,1);
stem(t,power(0.5,t))
subplot(2,2,2);
stem(t,power(2,t))
subplot(2,2,3);
stem(t,power(-0.5,t))
subplot(2,2,4);
stem(t,power(-2,t))
%% Delay & Advance
clear;clc;
s = [1,2,3,4,5,6,7,8,9,10];
o = 6;
k = 3;
%% Function
subplot(3,1,1);
stem(s);
title('Function');
%% Delay
d = delay(s,o,k);
subplot(3,1,2);
stem(d);
title('Delay');
%% Advance
a = advance(s,o,k);
subplot(3,1,3);
stem(a);
title('Advance');
%% 
o = 1:length(s)
o = o-6
stem(o,s)
%% 
d = delay(s,o,k)