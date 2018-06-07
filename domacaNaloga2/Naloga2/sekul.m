function lambda=sekul(rho,u,d,i)

% SEKUL(rho,u,d,i) poisce i-to niclo sekularne enacbe. To potrebujemo
% pri metodi deli in vladaj za iskanje lastnih vrednosti in 
% vektorjev simetricne tridiagonalne matrike.

% predznak rho nam pove, na katerem koncu lezi t.i. prosta nicla
% pri ostalih niclah uporabimo aproksimacijo z dvem poloma

delta=1e-10;

n=length(u);
u2=u.^2;

if rho<0 
  il=i-1;
  ir=i;
else
  il=i;
  ir=i+1;
end

% ta postopek deluje, ce racunamo niclo v notranjosti. 
% na robu je postopek drugacen, tamn aproksimiramo le z eno funkcijo

if ((rho>0) & (i<n)) | ((rho<0) & (i>1))

  if rho>0 
    x=d(il)+0.1*(d(ir)-d(il));
    pol=d(il);
  else
    x=d(ir)-0.1*(d(ir)-d(il));
    pol=d(ir);
  end
  
  x=0.6091;
  oldx=x+1;

  while abs(oldx-x)>delta

    [psi1,psi1odvod]=psiFunkcija(rho,u2(1:il),d(1:il),x);
    [psi2,psi2odvod]=psiFunkcija(rho,u2(ir:n),d(ir:n),x);

    c1=psi1odvod*(d(il)-x)^2;
    c1s=psi1-psi1odvod*(d(il)-x);
  
    c2=psi2odvod*(d(ir)-x)^2;
    c2s=psi2-psi2odvod*(d(ir)-x);

    c3=1+c1s+c2s;

    polinom=[c3, -c1-c2-c3*(d(il)+d(ir)), c1*d(ir)+c2*d(il)+c3*d(il)*d(ir)];

    res=roots(polinom);

    % tisti, ki je znotraj intervala, je boljsi

    oldx=x;
    if d(il)<res(1) & res(1)<d(ir)
      x=res(1);
    else
      x=res(2);
    end
  end
end


if ((rho>0) & (i==n)) % sedaj iscemo zadnjo niclo
  x=d(n)+1e06;
  oldx=x+1;

  while abs(oldx-x)>delta
    [psi1,psi1odvod]=psiFunkcija(rho,u2,d,x);

    c1=psi1odvod*(d(n)-x)^2;
    c1s=psi1-psi1odvod*(d(n)-x);
  
    c3=1+c1s;
    oldx=x;
    x=d(n)+c1/c3;
  end
end

if ((rho<0) & (i==1)) % sedaj iscemo prvo niclo
  x=d(1)-1e06;
  oldx=x+1;

  while abs(oldx-x)>delta
    [psi1,psi1odvod]=psiFunkcija(rho,u2,d,x);

    c1=psi1odvod*(d(1)-x)^2;
    c1s=psi1-psi1odvod*(d(1)-x);
  
    c3=1+c1s;
    oldx=x;
    x=d(1)+c1/c3;
  end
end

lambda=x;