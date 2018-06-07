function [najboljsi_alpha, S] = priblizniAlpha(Bhat, beta, sigma, N, koraki, interval)
% funkcija vrne priblizno izracunani kappa, ki ga dobimo tako, da
% izracunamo nekaj vrednosti kappa(a)
if nargin<5
  koraki = 50;
end

if nargin<6
  interval = 1;
end


n = linspace(0, interval, N+1);
S = zeros(N, 3);
for i=1:N
    [L_x, L_y] = Lparams(Bhat, beta, sigma, n(i+1));
    S(i,:) = [n(i+1) L_x, L_y];
end
    
for k=1:koraki
    ro_bar = spline(S(:,1),S(:,2));
    ni_bar = spline(S(:,1),S(:,3));
    
    dro_bar = ro_bar;
    dni_bar = ni_bar;
    
    % V dro_hat in dni_hat shranimo 1. odvode polinomskih zlepkov
    pd = 3; 
    D = diag(pd:-1:1,1);
    for i = 1:1
      dro_bar.coefs = dro_bar.coefs*D;
      dni_bar.coefs = dni_bar.coefs*D;
    end
    
    ddro_bar = ro_bar;
    ddni_bar = ni_bar;
    
    % V dro_hat in dni_hat shranimo 2. odvode polinomskih zlepkov
    pd = 3; 
    D = diag(pd:-1:1,1);
    for i = 1:2
      ddro_bar.coefs = ddro_bar.coefs*D;
      ddni_bar.coefs = ddni_bar.coefs*D;
    end
    
    f1 = @(x) abs(ppval(dro_bar, x) * ppval(ddni_bar, x) - ppval(ddro_bar, x) * ppval(dni_bar, x));
    f2 = @(x) norm([ppval(dni_bar, x),ppval(dro_bar, x)])^3;
    ukrivljenost = @(x)-f1(x)/f2(x);
   
    a_max = fminbnd(ukrivljenost, 0, interval);
    [L_x, L_y] = Lparams(Bhat, beta, sigma, a_max);
    S(N+k,:) = [a_max L_x, L_y];
end
najboljsi_alpha = S(end, 1);
end
