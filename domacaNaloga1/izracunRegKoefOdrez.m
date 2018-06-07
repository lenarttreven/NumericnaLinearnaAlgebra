function Fi = izracunRegKoefOdrez(sigma, odrez)
% Vrne regulacijske koeficjente, ki jih dobimo pri regularizaciji
% z odrezom
Fi = sigma;
[m, n] = size(Fi);
for i=1:m
    for j=1:n
        if Fi(i, j) <= odrez
            Fi(i, j) = 0;
        else
            Fi(i, j) = 1;
        end
    end
end
end

