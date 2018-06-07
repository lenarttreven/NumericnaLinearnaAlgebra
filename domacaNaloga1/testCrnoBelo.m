% to poskrbi, da je X vedno ista random matrika
nakljucno = rng('default');
rng(2);

X = imread('butterfly.jpg');
X = rgb2gray(X);

%sedaj je X crnobela
X = im2double(X);

[n, m] = size(X);

%to je parametr s, ki ga spreminjamo
s=2;
[PSF, center] = psfGauss([n,m],s);
[Ar, Ac] = kronDecomp(PSF, center);

[Ur, Sr, Vr] = svd(Ar);
[Uc, Sc, Vc] = svd(Ac);

%sedaj bomo sliko zameglili
B = Ac * X * Ar';

%to je paramter e, ki ga spreminjamo
e = 1;
E = e * rand(n,m);
Bhat = B + E ;
%Bhat je zamegljena slika, kateri smo dodali tudi ?um E

naivniB = Vc * (Sc\Uc'* Bhat * Ur/Sr') * Vr';
% ?e poiskusimo na naiven nacin brez regularizacije in prikazemo sliko B
% dobimo zelo slab rezultat 
%imagesc(B), axis image, colormap(gray);


% za optimalen alpha sedaj pozenemo posciMaxAlpha, ki nam izracuna najboljsi
% alpha, hkrati nam tudi narise graf, kako zgleda ukirvljenost krivlje. 
% optimalen alpha je shranjen kot x


% ce delamo z odrezano regulacijo, je dober odrez okrog 0.3
beta = Uc' * Bhat * Ur;
sigma = diag(Sc) * diag(Sr)';

% koda, ki jo pozenmo, ce zelimo imeti rezultate, ki so nastali kot
% regularizacija tihonova, za alpha izbermo tistega, ki na ga kot
% optimalnega ponudi matlabova funkcijca za iskanje ekstremov
alpha = najboljsiAlpha(Bhat, beta, sigma);
Fi1  = izracunRegKoefTih(Sc, Sr, alpha);
M1 = izracunBetaMatrike(Uc, Ur, Sc, Sr, Bhat, Fi1);
X_algortiem1 = Vc * M1 * Vr';

% koda, ki jos pozenmo, ce zelimo imeti rezultate, ki so nastali kot
% regularizacija tihonova, za alpha uporabimo pribli?ni izra?un, ki je
% implentiran, kot v navodilih domace naloge
najboljsi_alpha = priblizniAlpha(Bhat, beta, sigma, 10, 5);
Fi2  = izracunRegKoefTih(Sc, Sr, najboljsi_alpha);
M2 = izracunBetaMatrike(Uc, Ur, Sc, Sr, Bhat, Fi2);
X_algortiem2 = Vc * M2 * Vr';


%koda, ki jo pozenemo, ce zelimo imeti rezultate, ki so nastali kot
%odrezani singularni razcep
odrez = izracunajMestoOdseka(beta, sigma);
Fi3  = izracunRegKoefOdrez(sigma, odrez);
M3 = izracunBetaMatrike(Uc, Ur, Sc, Sr, Bhat, Fi3);
X_algortiem3 = Vc * M3 * Vr';



% imagesc(Xhat), axis image, colormap(gray);

%Prikaz prvotne, zamegljene slike
%imagesc(Bhat), axis image, colormap(gray);


narisiKrivulje(Bhat, beta, sigma, alpha, s, e);
narisiBeteInSingularneVrednosti(beta, sigma, alpha, s, e);


% to izracuna problizni kappa z veliko manj operacijami, kot je sicre
% potrebno za izracun kappe

% [najboljsi_alpha, S] = priblizniKappa(Bhat, beta, sigma, 10, 5);


fig = figure;
subplot(2,2,1);
imagesc(Bhat), axis image, colormap(gray);
subplot(2,2,2);
imagesc(X_algortiem1), axis image, colormap(gray);
subplot(2,2,3);
imagesc(X_algortiem2), axis image, colormap(gray);
subplot(2,2,4);
imagesc(X_algortiem3), axis image, colormap(gray);


% zapis_datoteke = sprintf('s%de%dSlike', s, e);
% print(fig,zapis_datoteke,'-dpng')


%izra?un ostrine: 
GRAT_Bhat = fmeasure(Bhat,'GRAT');
LAPD_Bhat = fmeasure(Bhat,'LAPD');

GRAT_X_algortiem1 = fmeasure(X_algortiem1,'GRAT');
LAPD_X_algortiem1 = fmeasure(X_algortiem1,'LAPD');

GRAT_X_algortiem2 = fmeasure(X_algortiem2,'GRAT');
LAPD_X_algortiem2 = fmeasure(X_algortiem2,'LAPD');

GRAT_X_algortiem3 = fmeasure(X_algortiem3,'GRAT');
LAPD_X_algortiem3 = fmeasure(X_algortiem3,'LAPD');





