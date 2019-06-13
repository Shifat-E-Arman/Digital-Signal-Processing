s = [1 2 3 4 5];
o = 1:length(s);

% delay
d = 3;
od = o + d;
subplot(121)
stem(od,s);

% advance
a = 3;
oa = o - a;
subplot(122)
stem(oa,s);