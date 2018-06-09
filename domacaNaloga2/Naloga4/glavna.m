rand('state', 27151136);
T = rand(2, 3, 4, 5);
A = rand(6, 4);
zmnozek = zmnoziEksperiment(T, A, 3);
B = rand(4);
tensorDet = determinantaEksperiment(B);
napaka = det(B) - tensorDet;
fprintf('Tenzorska determinanta se od vgrajene razlikuje za %e\n', napaka)
