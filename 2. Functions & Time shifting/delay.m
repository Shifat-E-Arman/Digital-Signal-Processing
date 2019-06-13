function out = delay(s,o,k);
    out = zeros(size(s));
    for i = 1:size(out,2) % 1 means dimension of row, 2 means dimension of  column
        if(i>k)
            out(i)=s(i-k);
        end
    end
end