function s=predznak(x)

% SIGNUM(x) je signum funkcija, ki jo potrebujemo pri Householderjevih
% zrcaljenjih. To pomeni SIGNUM(x)=1 za x>=0, sicer pa -1.

% Bor Plestenjak
% 25.5.1994

if x>=0
  s=1;
else
  s=-1;
end
