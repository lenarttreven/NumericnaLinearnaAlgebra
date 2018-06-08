rand('state',27151136);
B=rand(9);
A=diag(diag(B))+diag(diag(B,1),1)+diag(diag(B,1),-1);
[q,l, d, u, rho]=deliinvladaj(A);