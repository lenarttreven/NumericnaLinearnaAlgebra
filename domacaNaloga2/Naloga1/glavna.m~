rand('state', 27151136);
A=rand(20, 10);
eps = 10^-8;
[sigma,U, koraki, steviloCilkov, Am]=onesidejaccycle(A, eps);
fprintf('Stevilo korakov: %d\n', koraki);
fprintf('Stevilo ciklov: %d\n', steviloCilkov);
sigma = sort(sigma, 'descend');
fprintf('Priblizek za najvecjo singularno vrednost: %f\n', sigma(1));


sigma1 = svd(Am);
for i=1:length(sigma1)
    napakaNaNasihPodatkih = abs(sigma1(i)- sigma(i));
    fprintf('Napaka na nasih podatkih za singularno vrednost s%d: %.3e\n',i, napakaNaNasihPodatkih);
    teoreticnaNapaka = koraki * eps * abs(sigma(i));
    fprintf('Teoreticna napaka za singularno vrednost s%d: %.3e\n',i, teoreticnaNapaka);
end