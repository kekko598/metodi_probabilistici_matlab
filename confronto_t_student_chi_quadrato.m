% Definisci il numero di gradi di libert� per la t-student e il chi-quadrato
df_t = 5;
df_chi2 = 5;

% Crea un vettore di valori x per la visualizzazione
x = -5:0.1:5;

% Calcola le probabilit� per i valori di x per la t-student
y_t = tpdf(x,df_t);

% Calcola le probabilit� per i valori di x per il chi-quadrato
y_chi2 = chi2pdf(x,df_chi2);

% Tracciare i grafici della t-student e del chi-quadrato
figure
hold on
plot(x,y_t,'r','LineWidth',2)
plot(x,y_chi2,'b','LineWidth',2)
xlabel('Valore')
ylabel('Probabilit�')
legend('t-student','Chi-quadrato')
title(sprintf('Distribuzione t-student con %d gradi di libert� e distribuzione chi-quadrato con %d gradi di libert�',df_t,df_chi2))
hold off