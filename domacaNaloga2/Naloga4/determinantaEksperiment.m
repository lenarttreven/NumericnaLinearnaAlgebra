function det = determinantaEksperiment(A)
%DETERMINANTA Summary of this function goes here
%   Detailed explanation goes here
n = length(A);
vektor_n = n * ones(1, n);
argument_n = num2cell(vektor_n);

X = zeros(argument_n{:});

start_ranges= ones(1, n);
end_ranges= n * ones(1, n);
operations= prod(end_ranges)-1;
result=start_ranges;
pos=length(end_ranges);
increments=0;
while increments < operations
    if result(pos)== end_ranges(pos)
        result(pos) = start_ranges(pos);
        pos = pos - 1;
    else
        result(pos) = result(pos) + 1;
        increments = increments + 1;
        pos =length(end_ranges); 
        if aliSmoEnaki(result) == 0
            c = num2cell(result);
            X(c{:}) =  (-1)^(predznakPermutacije(result));
        end
    end
end


det = X;
for i=1:n
    det = zmnoziEksperiment(det, A(:,i)',i);
end
end
