zadnjih6StevkVpisne = [1 5 1 1 3 6];
m = zadnjih6StevkVpisne(1:3);
m = 15 + 5 * sin(m);
k = zeros(1, 5);
for i=1:5
    k(i) = max(1, zadnjih6StevkVpisne(i) + zadnjih6StevkVpisne(i+1))/(i+2);
end


M = diag(m);
K = [-k(1)-k(2), k(2), 0;
    k(2), -k(2)-k(3)-k(4), k(3);
    0, k(3), -k(3)-k(5)];
K = -K;

% re?ujemo Kx = w^2Mx

M1 = sqrt(inv(M));
A = M1*K*M1;
[Z, lambda] = eig(A);
w = sqrt(diag(lambda));
X = M1 * Z;

%Vemo y = x*e(iwt)

najmanjsaLastnaFrekvenca = min(w);
obdobje = 4 * pi / najmanjsaLastnaFrekvenca;

y0 = [0;0;1];
y0_odvod = [0;0;0];

c = X\y0;
d = X\y0_odvod;
d = d ./ w; 

f1 =  @(t) X(:,1) * (c(1)* cos(w(1)*t)+ d(1)* sin(w(1)*t)) + X(:,2) * (c(2)* cos(w(2)*t)+ d(2)* sin(w(2)*t))+ X(:,3)* (c(3)* cos(w(3)*t)+ d(3)* sin(w(3)*t));

t = linspace(0, obdobje, 10000);
nihanja = f1(t);
plot(t, nihanja(1,:), t, nihanja(2,:), t, nihanja(3,:))
legend('Vozicek 1','Vozicek 2', 'Vozicek 3')













