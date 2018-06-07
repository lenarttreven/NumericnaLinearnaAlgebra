function [p, n] = Lparams(Bhat, beta, sigma, alpha)
% vrne ukrivljenost k(a)
b = Bhat(:);
beta = beta(:);
sigma = sigma(:);


n = sum(sigma.^2.*beta.^2./(alpha^2+ sigma.^2).^2);
n = log(n);
p = b'*b - sum(beta.^2) + alpha^4 * sum(beta.^2./(alpha^2+sigma.^2).^2);
p = log(p);