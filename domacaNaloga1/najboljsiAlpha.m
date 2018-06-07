function x = najboljsiAlpha(Bhat, beta, sigma)
% vrne najboljsi alpha, ki ga dobimo tam, kjer je krivulja tihonove
% regularizacije najbolj ukrivljena

% ker je imamo ordje za minimizacijo, definiramo f kot negativeno
% maksimizacijsko funckijo
f = @(x) -1*kappa(Bhat, beta, sigma, x);
x = fminbnd(f,0,1);
end

