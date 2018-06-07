function Y = zmnozi( X, A, j )
%ZMNOZI je funkcija, ki zmnozi tenzor X z matriko A v smeri j, kjer je X
% trorazse?en tenzor


[m1, m2]= size(A);
velikost_X = size(X);

if velikost_X(j) ~= m2
    error('Stevilo dimenzij se ne ujema!')
end


seznam = [j];
for ii=1:length(velikost_X)
    if ii ~= j
        seznam(end+1) = ii;
    end
end

inverzSeznam = zeros(1, length(velikost_X));
for ii=1:length(velikost_X)
    inverzSeznam(seznam(ii)) = ii;
end


X1 = permute(X, seznam);
[n1, n2, n3] = size(X1);

%sedaj izra?unajmo, kot da je j == 1
Y = zeros(m1, n2, n3);
for k = 1:m1
    for i2 = 1:n2
        for i3 = 1:n3
            vsota = 0;
            for i1 = 1:n1
                vsota = vsota + X1(i1, i2, i3) * A(k, i1);
            end
            Y(k, i2, i3) = vsota;
        end
    end    
end

Y = permute(Y, inverzSeznam);

end

