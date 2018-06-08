function M = razpri(T, j)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

velikost_T = size(T);
seznam = [j];
for ii=1:length(velikost_T)
    if ii ~= j
        seznam(end+1) = ii;
    end
end

T1 = permute(T, seznam);
M  = reshape(T1, velikost_T(j),prod(velikost_T)/velikost_T(j));
end

