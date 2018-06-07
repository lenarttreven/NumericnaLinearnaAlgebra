function [G, sprememba, steviloUnicevanj] = onesidejacrot(G,j,k, eps)

% ONESIDEJACROT(A,j,k) za dano matriko G naredi enostranskehga Jacobija
% pri racunanju SVD za G'*G, tako da z ortogonalno rotacijo unici 
% elementa na mestu (j,k).

% Bor Plestenjak
% 23.5.1994

Ajj=G(:,j)'*G(:,j);
Ajk=G(:,j)'*G(:,k);
Akk=G(:,k)'*G(:,k);

sprememba = 0;
steviloUnicevanj = 0;

if abs(Ajk)>eps*sqrt(Ajj*Akk)
	tau=( Ajj - Akk ) / ( 2 * Ajk );
	t=predznak(tau) / ( abs(tau) + sqrt(1+tau^2) );
	c=1/sqrt(1+t^2);
	s=c*t;
    G(:,[j,k])=zmnoziStolpce(G(:,[j,k]),c,s);
    sprememba = 1;
    steviloUnicevanj = steviloUnicevanj + 1;
    %fprintf('%e > %e\n',abs(Ajk),10^(-8)*sqrt(Ajj*Akk) )
end
