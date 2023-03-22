% Definisci una funzione di distribuzione di probabilità per il tempo di
% guasto e un parametro di media modificabile, di default 5
pd = makedist('Exponential','mu',5);

% Genera un numero di dati casuali che seguono la distribuzione di probabilità
num_data = 1000;
data = random(pd,num_data,1);

% Calcola il tasso di guasto h(t)
time = 0:0.1:50;%L'unità di misura del tempo è il secondo. Il tempo è espresso come un vettore che va da 0 a un valore che si vuole, aumentando di 0,1 ad ogni intervallo.

R = 1-cdf(pd,time);
h = -diff(R)./R(1:end-1);

% Calcola MTBF, MTTF e MTTR
MTTF = 1/pd.mu; %Tempo medio al fallimento
MTTR = mean(data(data > 0));%Tempo medio di riparazione
MTBF = MTTF+MTTR; %Tempo medio tra i guasti

% Visualizza la funzione di sopravvivenza R(t)
figure;
plot(time,R);
xlabel('Tempo (t)');
ylabel('Funzione di sopravvivenza R(t)');
title('Funzione di sopravvivenza');

% Visualizza il tasso di guasto h(t)
figure;
plot(time(1:end-1),h);
xlabel('Tempo (t)');
ylabel('Tasso di guasto h(t)');
title('Tasso di guasto');

% Visualizza la distribuzione del tempo di guasto
figure;
histogram(data,'Normalization','pdf');
xlabel('Tempo (t)');
ylabel('Probabilità');
title('Distribuzione del tempo di guasto (descrive la probabilità di un guasto in un intervallo di tempo specifico, quindi decresce man mano che un intervallo di tempo aumenta)');

% Visualizza la distribuzione cumulativa del tempo di guasto
figure;
histogram(data,'Normalization','cdf');
xlabel('Tempo (t)');
ylabel('Probabilità cumulativa');
title('Distribuzione cumulativa del tempo di guasto (descrive la probabilità che un guasto accada entro un certo intervallo di tempo, quindi aumenta con un certo aumentare del tempo)');

% Visualizza i risultati in secondi
disp('MTBF(Tempo medio tra i guasti):');
disp(MTBF);
disp('MTTF(Tempo medio al fallimento):');
disp(MTTF);
disp('MTTR(Tempo medio di riparazione):');
disp(MTTR);