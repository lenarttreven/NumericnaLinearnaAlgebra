function Fi = izracunRegKoefTih(Sc, Sr, alpha)
% Vrne regulaacijske koeficjente, ki jih dobimo pri regularizaciji
% tihonovega
vecSc = diag(Sc);
vecSr = diag(Sr);
Fi = vecSc * vecSr';
Fi = Fi .^2 ./ (Fi .^2 + alpha^2);

