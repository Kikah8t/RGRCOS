Fd = 1e5; %Частота дискретизации
Td = 1/Fd; %Период Дискретизации
N = 1e5; %Кол-во отсчетов сигнала
t = 0:Td:N*Td-Td; %Дискретное нормированное время
fd = 1/(N*Td); %шаг по частоте
f =(0:N-1)*fd; %Дискретная частота

% Сигнал x1[n]
T1 = 20 *1e-3;
F1 = 1/T1;
x1 = Td*sawtooth(2*pi*t*F1);

% Сигнал x2[n]
T2 = 25*1e-3;
F2 = 1/T2;
x2 = Td*square(2*pi*t*F2);

% Амплитудный спектр X1[m]
X1 = fft(x1);
Tn1 = T1/Td; % Период в отсчетах
C1 = (2/Tn1)*abs(X1);
C1(1) = (1/Tn1)*abs(X1(1)); 

% Амплитудный спектр X2[m]
X2 = fft(x2);
Tn2 = T2/Td;
C2 = (2/Tn2)*abs(X2);
C2(1) = (1/Tn2)*abs(X2(1)); 

% Построение графиков
figure('Name','Вариант 20','NumberTitle','off');
subplot(2,2,1),stem(t*N,x1,'.'),grid on,xlim([0 2*N*T1]),title('Сигнал x1[n]'),xlabel('n'),ylabel('x1[n] [В * c]');
subplot(2,2,3),stem(t*N,x2,'.'),grid on,xlim([0 2*N*T2]),title('Сигнал x2[n]'),xlabel('n'),ylabel('x2[n] [В * c]');
subplot(2,2,2),stem(f/F1,C1),grid on,xlim([0 10]),ylim([0 3.5e-4]),title('Спектр X1[m]'),xlabel('m'),ylabel('X1[m] [В]');
subplot(2,2,4),stem(f/F2,C2),grid on,xlim([0 10]),title('Спектр X2[m]'),xlabel('m'),ylabel('X2[m] [В]');

figure('Name','Вариант 20','NumberTitle','off');
subplot(2,2,1),stem(f/F1,C1),grid on,xlim([1980 Tn1]),ylim([0 3.5e-4]),title('Спектр X1[m]'),xlabel('m'),ylabel('X1[m] [В]');
subplot(2,2,3),stem(f/F2,C2),grid on,xlim([2450 Tn2]),title('Спектр X2[m]'),xlabel('m'),ylabel('X2[m] [В]');