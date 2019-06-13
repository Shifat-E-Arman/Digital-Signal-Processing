function [YY, NN] = myconv(x,h)
    
for n=1:length(x)+length(h)-1
    y1(n)=0;
    for k=1:length(x)
       if (n-k+1>0) & (n-k+1<=length(h))
            y1(n)=y1(n)+x(k)*h(n-k+1);
       else
       end
    end
end

YY = y1;
end