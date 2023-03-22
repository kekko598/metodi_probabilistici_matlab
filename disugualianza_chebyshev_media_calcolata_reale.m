% Definisci la media e la deviazione standard
mu = 0;
sigma = 1;

% Genera un set di dati casuali che seguono una distribuzione normale
num_data = 10000;
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
subplot(2,1,1);
plot(h,prob,'-o',h,chebyshev,'-x');
xlabel('h');
ylabel('Probabilità');
legend('Probabilità misurata Pr{|Y-mu|>=h}','Chebyshev sigma^2/h^2');
title('Confronto tra probabilità misurata e Chebyshev ');

subplot(2,1,2);
histogram(data,'Normalization','pdf');
hold on;
x = linspace(min(data),max(data),1000);
y = normpdf(x,mu,sigma);
plot(x,y,'LineWidth',2,'Color','y');
line([mean_data mean_data],[0 max(y)],'Color','r','LineWidth',2);
legend('Dati','Distribuzione','Media');
xlabel('Valori');
ylabel('Probabilità');
title('Media della distribuzione normale');