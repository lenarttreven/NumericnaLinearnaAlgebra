function [q,l, d, u, bm]=deliinvladaj(A)

% [X,D]=DELIINVLADAJ(A) izracuna lastne vrednosti in vektorje simetricne 
% tridiagonalne matrike A preko metode deli in vladaj

n=length(A);

if n==1 
  q=1;
  l=A;
else
  m=floor(n/2);
  bm=A(m,m+1);

  T1=A(1:m,1:m);
  T1(m,m)=T1(m,m)-bm;
  T2=A((m+1):n,(m+1):n);
  T2(1,1)=T2(1,1)-bm;

  [Q1,L1]=eig(T1);
  [Q2,L2]=eig(T2);
  Q=[Q1, zeros(m,n-m); zeros(n-m,m), Q2];

  pomu=[Q1(m,:)'; Q2(1,:)']';
  pomd=[diag(L1);diag(L2)]';
  [d,perm]=sort(pomd);
  u=pomu(perm);
  las=sekular(bm,u,d);

  for i=1:n % Lastni vektorji
    Qpom(:,i)= pomu' ./ (pomd-las(i))';
    Qpom(:,i)= Qpom(:,i)/norm(Qpom(:,i));
  end
  
  q=Q*Qpom;  
  l=diag(las);
  
end
  
  