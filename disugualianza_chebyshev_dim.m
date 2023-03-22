
%Questo codice visualizza un grafico che confronta la probabilit� 
%misurata e il valore massimo calcolato dalla disuguaglianza di Chebyshev. 
%Come si pu� vedere dal grafico, la probabilit� misurata � sempre inferiore al valore massimo calcolato dalla disuguaglianza di Chebyshev, 
%dimostrando cos� la validit� della disuguaglianza di Chebyshev.


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

% Calcola la probabilit� che la differenza tra la media dei dati e un singolo valore sia maggiore di h
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
ylabel('Probabilit�');
legend('Probabilit� misurata Pr{|Y-mu|>=h}','Chebyshev sigma^2/h^2');
title('Confronto tra probabilit� misurata e Chebyshev ');

