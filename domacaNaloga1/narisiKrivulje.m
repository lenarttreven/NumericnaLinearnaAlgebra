function  narisiKrivulje(Bhat, beta, sigma, alpha,s, e)
 
    n = linspace(0.0000001, 10, 100);
    f = @(x) kappa(Bhat, beta, sigma, x);
    y = zeros(1,100);

    for i=1:100
        y(i) = f(n(i));
    end

    fig = figure;
    ax1 = subplot(2,1,1);
    plot(n, y)
    hold on
    scatter(alpha, f(alpha))
    title(ax1,'Ukrivljenost')
    xlabel(ax1,'alpha')

    ax2 = subplot(2,1,2);
    ys = zeros(1,100);
    xs = zeros(1,100);
    g = @(x) Lparams(Bhat, beta, sigma, x);
    for i=1:100
        [xs(i), ys(i)] = g(n(i));
    end
    plot(xs, ys)
    hold on
    [x_alpha, y_alpha] = g(alpha);
    scatter(x_alpha, y_alpha)
    title(ax2,'L krivulja')
    
%     zapis_datoteke = sprintf('s%de%dLGrafi', s, e);
%     print(fig,zapis_datoteke,'-dpng')
end








