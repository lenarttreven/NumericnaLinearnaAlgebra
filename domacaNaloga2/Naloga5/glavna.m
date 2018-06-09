rand('state',27151136);
X=rand(5, 200, 200);
[G, U1, U2, U3] = hosvd(X, 3, 3, 3);

X_hat = zmnozi(zmnozi(zmnozi(G, U1, 1), U2, 2), U3, 3);

sqrt(sum(sum(sum((X - X_hat).^2))))