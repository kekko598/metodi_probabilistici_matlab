% Generiamo una distribuzione chi-quadrato con gamma gradi di libertà
df = 3;
rng default
r = chi2rnd(df,1000,1);

% Calcoliamo la media e la varianza teorica
mean_theoretical = df;
variance_theoretical = 2*df;

% Calcoliamo la media e la varianza campionaria
mean_sampled = mean(r);
variance_sampled = var(r);

% Stampiamo i valori teorici e quelli ottenuti dal campione
fprintf('Media teorica: %.2f\n', mean_theoretical);
fprintf('Media campionaria: %.2f\n\n', mean_sampled);
fprintf('Varianza teorica: %.2f\n', variance_theoretical);
fprintf('Varianza campionaria: %.2f\n\n', variance_sampled);

% Disegniamo un istogramma per rappresentare la distribuzione campionaria
figure;
histogram(r, 'Normalization', 'pdf');
hold on;

% Disegniamo la curva di densità teorica della distribuzione chi-quadrato
x = 0:0.01:12;
y = chi2pdf(x,df);
plot(x,y,'LineWidth',2);

% Aggiungiamo le etichette per i grafici
legend('Distribuzione campionaria', 'Distribuzione teorica');
xlabel('x');
ylabel('Densità');
title(sprintf('Distribuzione chi-quadrato con %d gradi di libertà', df));