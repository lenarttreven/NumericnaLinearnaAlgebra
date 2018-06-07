function lambda=sekular(rho,u,d)

% SEKULAR(rho,u,d,i) poisce vse nicle sekularne enacbe. To potrebujemo
% pri metodi deli in vladaj za iskanje lastnih vrednosti in 
% vektorjev simetricne tridiagonalne matrike.

for i=1:length(u)
  lambda(i)=sekul(rho,u,d,i);
end
