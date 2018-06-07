function predznak = predznakPermutacije(x)
%PREDZNAKPERMUTACIJE Summary of this function goes here
%   Detailed explanation goes here
n = length(x);
permutacija = zeros(1, n);
for i=1:n
    permutacija(x(i)) = i;
end
steviloInverzij = 0;
for i=1:n
    for j=i+1:n
        if permutacija(i) > permutacija(j)
            steviloInverzij = steviloInverzij + 1;
        end
    end
end
predznak = mod(steviloInverzij, 2);

end

