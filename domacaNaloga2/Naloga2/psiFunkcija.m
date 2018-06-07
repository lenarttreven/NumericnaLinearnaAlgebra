function [y,odvod]=psiFunkcija(rho,u,d,lambda)

% PSI(u,d,lambda) vrne delno vsoto, ki jo potrebujemo pri funkciji
% SEKULAR. Predpostavljeno je, da vektor u ze vsebuje kvadrate u_i.

pom=d-lambda;

y=rho*sum(u ./ pom);
odvod=rho*sum(u ./ pom.^2);