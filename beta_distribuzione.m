%Generazione dei valori casuali per la distribuzione beta
a = 10/20; % parametro alpha
b = 10/20; % parametro beta
n = 10000; % numero di valori casuali

% generazione dei valori casuali
x = betarnd(a,b,1,n);

% calcolare la media
mean_beta = mean(x);

% calcolare la deviazione standard
std_beta = std(x);

% rappresentare la distribuzione dei valori casuali generati
histogram(x, 'Normalization', 'pdf');
hold on;

% calcolare la funzione densità di probabilità teorica per la distribuzione beta
x_vals = linspace(0,1,100);
pdf_beta = betapdf(x_vals,a,b);
plot(x_vals, pdf_beta, 'LineWidth', 2);
xlabel('Valori Casuali');
ylabel('Funzione di Densità di Probabilità');
title(sprintf('Distribuzione Beta con a=%d e b=%d', a, b));
legend('Distribuzione dei Valori Casuali Generati', 'Funzione Densità di Probabilità Teorica');
