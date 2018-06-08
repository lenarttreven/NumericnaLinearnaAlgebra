function Y = zmnoziEksperiment( X, A, j )
%ZMNOZI je funkcija, ki zmnozi tenzor X z matriko A v smeri j, kjer je X
% n razsezen tenzor


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
velikost_X1 = size(X1);


n1 = velikost_X1;
velikost_X1(1) = m1;
Y = zeros(velikost_X1);

start_ranges= ones(1, length(velikost_X1));
end_ranges=velikost_X1;
operations= prod(end_ranges)-1;
result=start_ranges;
pos=length(end_ranges);
increments=0;
vsota = 0;
for i1 = 1:n1
    c = num2cell([i1, result(2:end)]);
    vsota = vsota + X1(c{:}) * A(result(1), i1);
end
c = num2cell(result);
Y(c{:}) = vsota;
while increments < operations
    if result(pos)== end_ranges(pos)
        result(pos) = start_ranges(pos);
        pos = pos - 1;
    else
        result(pos) = result(pos) + 1;
        increments = increments + 1;
        pos =length(end_ranges); 
        vsota = 0;
        for i1 = 1:n1
            c = num2cell([i1, result(2:end)]);
            vsota = vsota + X1(c{:}) * A(result(1), i1);
        end
        c = num2cell(result);
        Y(c{:}) = vsota;
    end
end

Y = permute(Y, inverzSeznam);

end