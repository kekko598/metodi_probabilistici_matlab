
%Questo codice visualizza un grafico che confronta la probabilità 
%misurata e il valore massimo calcolato dalla disuguaglianza di Chebyshev. 
%Come si può vedere dal grafico, la probabilità misurata è sempre inferiore al valore massimo calcolato dalla disuguaglianza di Chebyshev, 
%dimostrando così la validità della disuguaglianza di Chebyshev.


% Definisci la media e la deviazione standard
mu = 0;
sigma = 1;

% Genera un set di dati casuali che seguono una distribuzione normale
num_data = 1000;
data = mu + sigma.*randn(num_data,1);

% Calcola la media dei dati
mean_data = mean(data);

% Definisci h
h = 0.1:0.1:3;

% Calcola la probabilità che la differenza tra la media dei dati e un singolo valore sia maggiore di h
prob = zeros(size(h));
for i = 1:length(h)
prob(i) = sum(abs(data-mean_data) > h(i))/num_data;
end

% Calcola il valore massimo calcolato dalla disuguaglianza di Chebyshev
chebyshev = (sigma^2)./(h.^2);

% Visualizza i risultati sotto forma di grafici
figure;
plot(h,prob,'-o',h,chebyshev,'-x');
xlabel('h');
ylabel('Probabilità');
legend('Probabilità misurata Pr{|Y-mu|>=h}','Chebyshev sigma^2/h^2');
title('Confronto tra probabilità misurata e Chebyshev ');

