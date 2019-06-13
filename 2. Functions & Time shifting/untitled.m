
s = [1 2 3 4 5];

% delay
sd = length(s);
d = 3;
for i = 1:length(s)
	if(i <= 3)
		sd(i) = 0;
	else 
		sd(i) = s(i-d);
    end
end
stem(sd)
% advance
a = 3
sa = length(s)
for i = 1:length(s)
	if(i < length(s)-a+1)
		sa(i) = s(i+a);
	else
		sa(i) = 0;
    end
end