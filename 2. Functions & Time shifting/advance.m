function out = advance(s,o,k);
    out = zeros(size(s));
    for i = 1:size(out,2)
        if(i<(size(s,2)-k+1))
            out(i)=s(i+k);
        end
    end
end