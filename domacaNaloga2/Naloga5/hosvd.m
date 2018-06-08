function [G, U1, U2, U3] = hosvd(X, n1, n2, n3)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Us = cell(1, 3);
n = [n1 n2 n3];
for i=1:3
    S = razpri(X, i);
    [U, Sigma, V] = svd(S);
    Us{i} = U(:, 1:n(i));
end
G = zmnozi(zmnozi(zmnozi(X, Us{1}',1), Us{2}',2), Us{3}', 3);
U1 = Us{1};
U2 = Us{2};
U3 = Us{3};
end
