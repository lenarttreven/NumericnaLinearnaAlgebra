function t = aliSmoEnaki(v)
%ALISMOENAKI Summary of this function goes here
%   Detailed explanation goes here
t = 0;
n = length(v);
for i=1:n
    for j=i+1:n
        if v(i) == v(j)
            t = 1;
            break
        end
    end
end
end

