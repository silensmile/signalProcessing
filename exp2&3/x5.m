clear; 

n1 = 0:7;
n2 = 0:15;
x5_8 = sin(pi / 8 * n1);
x5_16 = sin(pi / 8 * n2);
X5_8 = abs(fft(x5_8,8));
X5_16 = abs(fft(x5_16,16));

figure;
subplot(2,2,1);
stem((0:1:7),x5_8,'filled')
xlabel('n');
ylabel('x5(n)');

subplot(2,2,3);
stem((0:1:7),X5_8,'filled');
xlabel('k');
ylabel('|X5(k)|');

subplot(2,2,2);
stem((0:1:15),x5_16,'filled')
xlabel('n');
ylabel('x5(n)');

subplot(2,2,4);
stem((0:1:15),X5_16,'filled');
xlabel('k');
ylabel('|X5(k)|');