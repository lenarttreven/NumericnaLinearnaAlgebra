function k = kappa(Bhat, beta, sigma, alpha)
% vrne ukrivljenost k(a)
b = Bhat(:);
beta = beta(:);
sigma = sigma(:);

n = sum(sigma.^2.*beta.^2./ (alpha^2+ sigma.^2).^2 );
dn = -4 * alpha *    sum((sigma.^2.*beta.^2) ./ (alpha^2 +sigma.^2).^3);
ddn =  -4* sum(beta.^2.*sigma.^2.*(sigma.^2-5*alpha^2) ./ (alpha^2 + sigma.^2).^4);

p = b'*b - sum(beta.^2) + alpha^4 * sum(beta.^2./(alpha^2+sigma.^2).^2);
dp = 4* sum(alpha^3 * beta.^2.*sigma.^2 ./ (alpha^2 + sigma.^2).^3);
ddp = 12 * sum(beta.^2.*sigma.^2.*(alpha^2 * sigma.^2 - alpha^4) ./ (alpha^2 + sigma.^2).^4);

dpravi_n = dn / n;
ddpravi_n = (ddn * n -  dn^2)/n^2;

dpravi_p = dp / p;
ddpravi_p = (ddp*p- dp^2)/p^2;

k = abs(dpravi_p*ddpravi_n - ddpravi_p*dpravi_n) / norm([dpravi_p,dpravi_n])^3;
end

