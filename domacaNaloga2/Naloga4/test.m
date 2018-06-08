start_ranges= [1 1 1];
end_ranges=[3,2,6];
operations= prod(end_ranges)-1;
result=start_ranges;
pos=length(end_ranges);
increments=0;
disp(result);
while increments < operations
    if result(pos)== end_ranges(pos)
        result(pos) = start_ranges(pos);
        pos = pos - 1;
    else
        result(pos) = result(pos) + 1;
        increments = increments + 1;
        pos =length(end_ranges); 
        disp(result)
    end
end