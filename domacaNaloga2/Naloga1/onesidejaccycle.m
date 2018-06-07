function [sigma,U, koraki, steviloCilkov, Am]=onesidejaccycle(A, eps)

% ONESIDEJACCYCLE(A) izvaja ciklicno Jacobijevo metode za iskanje singularnih
% vrednosti matrike A, ki gre skozi vse izvediagonalne elemente in jih unici 

% Bor Plestenjak
% 11.4.2000

k=0;
[m, n] = size(A);
if m < n
    A = A';
end

[m, n] = size(A);
k=k+1;
koraki = 0;
nadaljuj = 1;
while nadaljuj ==1
  % Ciklicna metoda 
  %disp(k);
  nadaljuj = 0;
  for p=1:n-1
     for q=p+1:n 
        [A, smoSeSpremenili, steviloUnicevanj] = onesidejacrot(A,p,q, eps);
         if smoSeSpremenili == 1
             koraki = koraki + steviloUnicevanj;
             nadaljuj = 1;
         end
     end
  end
  k = k+1;
end


for i=1:n
   sigma(i)=norm(A(:,i));
   U(:,i)=A(:,i)/sigma(i);
end
sigma = sigma';
steviloCilkov = k;
Am = A;

