function t = izracunajMestoOdseka(beta, sigma)
%izracuna mesto odseka
beta = beta(:);
sigma = sigma(:);
beta = (beta - min(beta)) / ( max(beta) - min(beta));
N = length(beta);

pred_sortiranjem = [beta, sigma];
po_sortiranju = sortrows(pred_sortiranjem,-2);

counter = 0;
t = 0;
for k=1:N
    if po_sortiranju(k,1) * 4 > po_sortiranju(k,2)
        counter = counter + 1;
        if counter == 20
            t = po_sortiranju(k,2);
            break
        end
    end
end
end

