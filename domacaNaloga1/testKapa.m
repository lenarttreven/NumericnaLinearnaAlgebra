B = [ 0.41246   0.78370   0.31975   0.96502   0.95247;
      0.17615   0.94799   0.94642   0.80055   0.32278;
      0.11513   0.42707   0.37129   0.41755   0.56765;
      0.45279   0.59082   0.73599   0.57491   0.72218];
bet = [0.8100125   0.9716341   0.4608841   0.0855099   0.2715636;
       0.0483966   0.0208813   0.9676828   0.4374756   0.9018974;
       0.5439195   0.1829312   0.8173782   0.0474405   0.6874833;
       0.2654216   0.3994010   0.1872799   0.8632746   0.0098513];
sig = [0.9272504   0.0419763   0.8260569   0.5106031   0.1862611;
       0.0716005   0.1819149   0.9152726   0.4420236   0.8723322;
       0.5282014   0.0461447   0.8033030   0.4751129   0.4374470;
       0.9773404   0.5351432   0.9835311   0.4897126   0.0048723];
alfe = [0.01, 0.5, 1, 2.5, 3.141, 2.7182818];
kape = [0.248184480590532,
        0.00923365115640566,
        0.0863156773328245,
        0.0274950860415332,
        0.0181492242035141,
        0.0236683161361814];
vse_ok = true;
sporocilo = 'Pri alfa = %f sem pricakoval\nkapa = %f\na sem dobil\nkapa = %f\n';
for i=1:length(alfe)
    k = kappa(B, bet, sig, alfe(i));
    if abs(k - kape(i)) > 10^-10
        fprintf(sporocilo, alfe(i), kape(i), k);
        vse_ok = false;
        break;
    end
end
if vse_ok
    fprintf('Vsi testi prestani.\n');
end

    

 