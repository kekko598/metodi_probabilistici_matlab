% Generazione dei dati campionari
n = 50; % Numero di osservazioni
mu = 10; % Media
sigma = 2; % Deviazione standard
X = normrnd(mu,sigma,n,1); % Generazione di n osservazioni da una distribuzione gaussiana

% Calcolo della media campionaria e della varianza campionaria
X_mean = mean(X);
S_squared = sum((X-X_mean).^2)/(n-1);

% Calcolo degli intervalli di confidenza
dof = n-1; % Gradi di libertà
alpha = 0.05; % Livello di confidenza
quantile = chi2inv(1-alpha/2,dof); % Quantile della distribuzione chi-quadrato
lower_bound = (dof*S_squared)/quantile; % Limite inferiore dell'intervallo di confidenza
upper_bound = (dof*S_squared)/chi2inv(alpha/2,dof); % Limite superiore dell'intervallo di confidenza

% Stampa dei risultati
fprintf('Intervallo di confidenza per la varianza a %.2f%% di livello di confidenza:\n', (1-alpha)*100);
fprintf('[%.4f, %.4f]\n', lower_bound, upper_bound);

% Grafico della distribuzione chi-quadrato e dell'intervallo di confidenza
x = 0:0.01:50;
y = chi2pdf(x,dof);
hold on;
plot(x,y,'LineWidth',2);
line([lower_bound lower_bound],[0 max(y)],'Color','red','LineStyle','--');
line([upper_bound upper_bound],[0 max(y)],'Color','red','LineStyle','--');
legend('Distribuzione chi-quadrato', 'Intervallo di confidenza');
xlabel('x');
ylabel('Densità di probabilità');
title('Intervallo di confidenza per la varianza');
hold off;
