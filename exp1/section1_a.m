%% 产生信号序列
clear;
A = 444.128;
a = 50 * sqrt(2) * pi;
Omega0 = 50 * sqrt(2) * pi;
n = 0:50;
f = 1000;
T = 1/f;
x_a = A * exp(-a * n * T) .* sin(Omega0 * n * T);
X_a = abs(fft(x_a));
subplot(1,2,1);
stem(x_a);
subplot(1,2,2);
plot(linspace(-2,2,2*length(n)-1),[fliplr(X_a(2:51)),X_a]);
