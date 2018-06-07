function det = determinanta(a, b, c)
%DETERMINANTA Summary of this function goes here
%   Detailed explanation goes here

X = zeros(3, 3, 3);

for i=1:3
    for j=1:3
        for k=1:3
            if i~=k & j~=k & i~=j
               X(i, j, k) =  (-1)^(predznakPermutacije([i j k]));
            end
        end
    end
end
det = zmnozi(zmnozi(zmnozi(X, a',1),b', 2), c',3);
end

