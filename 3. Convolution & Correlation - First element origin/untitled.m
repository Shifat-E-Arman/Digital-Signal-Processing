clc; 
close all;
%first sequence 
x=input('Enter x\n'); 
l1=input('Enter the lower limit:\n'); 
u1=input('Enter the upper limit:\n'); 
x1=l1:1:u1;%limit of sequence x(n)
%second sequence 
h=input('Enter h:\n'); 
l2=input('Enter the lower limit:\n'); 
u2=input('Enter the upper limit:\n'); 
h1=l2:1:u2;%limit of sequence h(n)
l=l1+l2; 
u=u1+u2;
a=l:1:u;%limit of output sequence y(n)
m=length(x);%length of sequence x(n) 
n=length(h);%length of sequence h(n)
X=[x,zeros(1,n)]; 
subplot(311) 
disp('x(n) is:') 
disp(x) 
stem(x1,x) 
xlabel('n') 
ylabel('x(n)') 
title('First Sequence') 
grid on;
H=[h,zeros(1,m)]; 
subplot(312) 
disp('h(n) is:') 
disp(h) 
stem(h1,h) 
xlabel('n') 
ylabel('h(n)') 
title('Second Sequence') 
grid on;
%CONVULATION 
for i=1:n+m-1 
Y(i)=0; 
for j=1:m 
if((i-j+1)>0) 
Y(i)=Y(i)+(X(j)*H(i-j+1)); 
else 
end 
end 
end
subplot(313) 
disp('y(n) is:') 
disp(Y) 
stem(a,Y) 
xlabel('n') 
ylabel('y(n)') 
title('Output Sequence') 
grid on;