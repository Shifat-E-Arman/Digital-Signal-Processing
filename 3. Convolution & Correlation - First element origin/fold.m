function [x,n] = fold(y,n1)
    x = y(size(y,2):-1:1);
    n = -n1(size(n1,2):-1,1);
end