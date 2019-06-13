clc;
clear;
x=[1 2 3 -4];
h=[1 3 -4 5];
len1=length(x);
len2=length(h);
o1=[1:len1];
n=3;
m=3;
oi=o1-n;
o2=[1:len2];
oj=o2-m;
fliph=flip(h);
 if len1~=len2
     a=len1-len2;
     for i=1:a
         h(len2+i)=0;
     end
 end
for i=1:len1+len2-1
    y(i)=0;
    for j=1:len2
        if (i-j+1>0) & (i-j+1<=len2)
        y(i)=y(i)+x(j)*fliph(i-j+1);
        end
    end
end
subplot(1,4,2);
stem(oi,x);
index=[-(m+n-2):len1-n+len2-m];
subplot(1,4,3);
stem(index,y);
index=index*-1;
subplot(1,4,4);
stem(index,y);

