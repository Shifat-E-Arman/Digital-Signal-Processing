clear; clc;
%% Input signal
x = [1 2 3 4 5 6 7];
%x = [3 2 1 1 2 3 1]
%% Fixing origin
o=[1:length(x)];
oo = o-3;
subplot(1,4,1)
stem(o,x)
title('Before fixing')
subplot(1,4,2)
stem(oo,x);
title('After fixing')
%% Delay
k = 5; % how much delay?
ood = oo + k;
subplot(1,4,3)
stem(ood,x)
title('Introducing delay')
%% Fold
oodf=ood*(-1);
subplot(1,4,4)
stem(oodf,x)
title('Fold')
%% Convolution
clear; clc;
x = [1 2 3 -4]; ox = [1:length(x)]; n = 3; ox = ox-n;
h = [1 3 -4 5]; oh = [1:length(h)]; m = 3; oh = oh-m;
%subplot(121)
%stem(ox,x)
%subplot(122)
%stem(oh,h)
for n = 1: length(x) + length(h) -1
    y1(n) = 0;
    for k = 1: length(x)
        if (n-k+1>0) & (n-k+1<=length(h))                                    
            y1(n) = y1(n)+x(k)*(h(n-k+1));
        end
    end
end
y1;
or = [-(m+n-2):length(x)-m+length(h)-n];
z = flip(or);
subplot(111)
stem(z,y1);
title('Convolution')
%% Correlation
clear; clc;
x = [1 2 3 -4]; ox = [1:length(x)]; n = 3; ox = ox-n;
h = [1 3 -4 5]; oh = [1:length(h)]; m = 3; oh = oh-m;
%stem(oh,x)
h = flip(h);
for n = 1: length(x) + length(h) -1
    y2(n) = 0;
    for k = 1: length(h)
        if (n-k+1>0) & (n-k+1<=length(h))                                    
            y2(n) = y2(n)+x(k)*(h(n-k+1));
        end
    end
end
or = [-(m+n-2):length(x)-m+length(h)-n];
z = flip(or);
stem(z,y2);
title('Correlation')
%%
y1 = conv(x,h) % convolution
y2 = conv(x,flip(h)) % correlation
y3 = xcorr(x,h) % correlation