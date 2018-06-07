function A=zmnoziStolpce(A,c,s)

% COLROT(A,c,s) za dano matriko A dimenzije q*2 in skalarja c,s pomnozi
% matriko A z matriko [c,-s; s,c] z desne.

% Bor Plestenjak
% 23.5.1994
% 11.4.2000 : zamenjava s in -s

r1=A(:,1); 
r2=A(:,2);
A(:,1)=c*r1+s*r2; 
A(:,2)=-s*r1+c*r2;
