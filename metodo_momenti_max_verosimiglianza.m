% Generare dati casuali
n = 50000; % numero di dati
mu = 5; % media
sigma = 2; % deviazione standard
data = normrnd(mu, sigma, n, 1); % dati casuali

% Calcolare la distribuzione di probabilità utilizzando il metodo dei momenti
mu_m = mean(data); % media campionaria
sigma_m = std(data); % deviazione standard campionaria
x = linspace(mu_m-4*sigma_m,mu_m+4*sigma_m,100);
y_momenti = normpdf(x,mu_m,sigma_m); % distribuzione di probabilità

% Calcolare la distribuzione di probabilità utilizzando il metodo della massima verosimiglianza
mu_ml = sum(data)/n; % media ML
sigma_ml = sqrt(sum((data-mu_ml).^2)/n); % deviazione standard ML
y_ml = normpdf(x,mu_ml,sigma_ml); % distribuzione di probabilità

% Grafico dei dati casuali e delle distribuzioni di probabilità
figure;
histogram(data, 'Normalization', 'pdf'); % dati casuali
hold on;
plot(x,y_momenti, 'LineWidth', 2, 'Color', 'r'); % metodo dei momenti
plot(x,y_ml, 'LineWidth', 2, 'Color', 'b'); % metodo della massima verosimiglianza
legend('Dati casuali', 'Metodo dei momenti', 'Metodo della massima verosimiglianza');
xlabel('Valori');
ylabel('Probabilità');
title('Distribuzione di probabilità con il metodo dei momenti e il metodo della massima verosimiglianza');
