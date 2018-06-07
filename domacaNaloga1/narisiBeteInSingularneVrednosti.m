function  narisiBeteInSingularneVrednosti(beta, sigma, odrez, s, e)
% Narisemo bete in singularne vrednosti
beta = beta(:);
sigma = abs(sigma(:));
beta = (beta - min(beta)) / ( max(beta) - min(beta));
N = length(beta);

pred_sortiranjem = [beta, sigma];
po_sortiranju = sortrows(pred_sortiranjem,-2);

fig = figure;

scatter(1:N,po_sortiranju(:,2), 'filled');
hold on

scatter(1:N,po_sortiranju(:,1), 'filled');
scatter(1:N,ones(1,N)* odrez, 'filled');
[h, ~] = legend({'singularne vrednosti', 'bete', 'mesto odreza'},'show');
% legend([singularne_vrednosti, bete],{'singularne vrednosti', 'bete'})
axis([0 N 0 1])

% zapis_datoteke = sprintf('s%de%dMestoOdreza', s, e);
% print(fig,zapis_datoteke,'-dpng')

end

