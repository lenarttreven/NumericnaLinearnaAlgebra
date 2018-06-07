function M = izracunBetaMatrike(Uc, Ur, Sc, Sr, Bhat, Fi)
%vrne izracunano matriko F koeficjentov regulacije
W = Sc\Uc' * Bhat * Ur/Sr;
M = W .* Fi;
end

