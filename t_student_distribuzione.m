% Creiamo un vettore di valori casuali
n = 1000;
mu = 0;
sigma = 1;
X = normrnd(mu, sigma, n, 1);

% Calcoliamo la media campionaria
Xbar = mean(X);

% Calcoliamo la varianza campionaria
S2 = var(X, 1);

% Calcoliamo il numero di gradi di libertà
df = n - 1;

% Generiamo un vettore di valori della t-student con i gradi di libertà
% corrispondenti
t = trnd(df, n, 1);

% Plottiamo la distribuzione t-student con i valori generati
figure;
histogram(t, 'Normalization', 'pdf');
hold on;

% Calcoliamo la media e la varianza teorica della t-student con i gradi di
% libertà corrispondenti
mu_teorico = 0;
sigma_teorico = sqrt(df / (df - 2));

% Plottiamo la distribuzione t-student teorica con la media e la varianza
% corrispondenti
x = -5:0.01:5;
y = tpdf(x, df);
plot(x, y, 'LineWidth', 2);

% Aggiungiamo una legenda
legend({'t-student generata', 't-student teorica'});

% Aggiungiamo un titolo e etichette per gli assi
title('Distribuzione t-student');
xlabel('x');
ylabel('Densità di probabilità');

% Calcoliamo l'intervallo di confidenza per la media con la t-student
alpha = 0.05;
t_alpha = tinv(1 - alpha / 2, df);
CI = [Xbar - t_alpha * sqrt(S2 / n), Xbar + t_alpha * sqrt(S2 / n)];
fprintf('Intervallo di confidenza per la media con la t-student: [%.4f, %.4f]\n', CI(1), CI(2));

