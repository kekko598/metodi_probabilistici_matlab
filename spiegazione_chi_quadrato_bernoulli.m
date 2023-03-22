% Dichiarazione dei parametri
n = 100; % Numero di prove
P = 0.5; % Probabilità di successo
N = n * P; % Aspettativa di successo

% Generazione di dati casuali per le prove
data = binornd(n, P, 1, 1000);

% Calcolo delle frequenze osservate
bins = 0:n;
frequenze_osservate = histc(data, bins);

% Calcolo delle frequenze attese
frequenze_attese = N * ones(1, n + 1);

% Calcolo del chi-quadrato
chi2 = sum((frequenze_osservate - frequenze_attese).^2 ./ frequenze_attese);

% Stampa del risultato
fprintf('Il valore di chi-quadrato è: %f\n', chi2);

% Grafico delle frequenze osservate e attese
bar(bins, frequenze_osservate);
hold on;
plot(bins, frequenze_attese, 'r--');
xlabel('Numero di successi');
ylabel('Frequenze');
legend('Osservate', 'Attese');
title('Distribuzione delle frequenze');