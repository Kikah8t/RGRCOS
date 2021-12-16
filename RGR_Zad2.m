A0 = 2;
k1 = 0.6;
k3 = pi/2;
f0 = 20*1e+3;
Fd = 1e5; %Частота дискретизации
Td = 1/Fd; %Период Дискретизации
N = 1e5; %Кол-во отсчетов сигнала
t = 0:Td:N*Td-Td; %Дискретное нормированное время
fd = 1/(N*Td); %шаг по частоте
fshift =(-N/2:N/2-1)*fd; %Дискретная частота

% Сигнал x1[n]
T1 = 20 *1e-3;
F1 = 1/T1;
x1 = sawtooth(2*pi*t*F1);

% Сигнал x2[n]
T2 = 25*1e-3;
F2 = 1/T2;
x2 = square(2*pi*t*F2);

%Сигнал со сложной модуляцией
Dif = 2 *(1 + 0.6.*x1).*cos((2*pi*f0).*t + k3 .* x2)*Td;

%Спектр сигнала
X = fft(Dif);
C = fftshift(abs(X));

figure('Name','Вариант 20','NumberTitle','off');
subplot(2,1,1);
plot(t, Dif);
xlim([0 0.06]);
title('Сигнал со сложной модуляцией');
xlabel('Td*n [c]');
ylabel('a(t) [В*c]');
grid on;

subplot(2,1,2);
stem(fshift,C,'.');
title('Спектр сигнала')
xlim([-2.5*1e4 2.5*1e4]);
ylim([0 0.7])
xlabel('f [Гц]');
ylabel('A(m) [В]');
grid on;

figure();
stem(fshift,C,'.');
xlim([1.96*1e4 2.04*1e4]);
grid on;
