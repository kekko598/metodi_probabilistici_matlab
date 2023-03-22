alfa = 1;
u = 200;
lambda = 0.01;
integral1 = integral(@(t) exp(-lambda*t.^alfa), 100, u);
integral2 = integral(@(t) lambda*alfa*t.^(alfa-1).*exp(-lambda*t.^alfa), 100, u);
disp(integral1);
disp(integral2);