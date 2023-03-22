% Crea un insieme di dati casuali
rng(0); % Imposta il seme del generatore di numeri casuali
data = randn(50,1); % Genera valori casuali distribuiti normalmente

% Crea il P-plot
figure;
subplot(2,1,1);
ecdf(data); % Crea la funzione di distribuzione empirica
hold on;
x = linspace(min(data), max(data)); % Crea un intervallo di valori
y = normcdf(x, mean(data), std(data)); % Calcola i quantili teorici
plot(x,y,'r-'); % Traccia i quantili teorici sulla linea y=x
legend('Dati', 'Distribuzione normale');
title('P-plot');

% Crea il Q-plot
subplot(2,1,2);
qqplot(data);
title('Q-plot');