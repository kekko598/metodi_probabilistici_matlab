n = 5; % numero di dati casuali

% generare dati casuali
rng(0); % imposta il seed per la generazione casuale dei numeri
X = randn(n,1);

% calcolare la media campionaria
mu = mean(X);

% calcolare la deviazione standard campionaria
sigma = std(X);

% calcolare la deviazione standard della media
se = sigma / sqrt(n);

% calcolare l'intervallo di confidenza per la t-student
t = tinv(0.975, n-1);
CI_t = mu + t * se * [-1, 1];

% calcolare l'intervallo di confidenza per il chi-quadrato
c = chi2inv(0.975, n-1);
CI_c = (n-1) * sigma^2 / c * [0.5, 1.5];

% disegnare la funzione densità di entrambi
x = linspace(mu-5*sigma, mu+5*sigma, 100);
pdf_t = tpdf(x, n-1);
pdf_c = chi2pdf(x.^2, n-1);

figure;
hold on;
plot(x, pdf_t, 'LineWidth', 2, 'Color', 'red');
plot(x, pdf_c, 'LineWidth', 2, 'Color', 'blue');
plot(CI_t, [0, 0], 'LineWidth', 2, 'Color', 'red', 'LineStyle', '--');
plot(CI_c, [0, 0], 'LineWidth', 2, 'Color', 'blue', 'LineStyle', '--');
hold off;

legend({'t-student', 'chi-quadrato', 'Intervallo di confidenza t-student', 'Intervallo di confidenza chi-quadrato'});
xlabel('x');
ylabel('Funzione densità');
title('Funzione densità di t-student e chi-quadrato');
