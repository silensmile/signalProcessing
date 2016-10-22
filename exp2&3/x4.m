clear; 

n1 = 0:7;
n2 = 0:15;
x4_8 = cos(pi / 4 * n1);
x4_16 = cos(pi / 4 * n2);
X4_8 = abs(fft(x4_8,8));
X4_16 = abs(fft(x4_16,16));

figure;
subplot(2,2,1);
stem((0:1:7),x4_8,'filled')
xlabel('n');
ylabel('x4(n)');

subplot(2,2,3);
stem((0:1:7),X4_8,'filled');
xlabel('k');
ylabel('|X4(k)|');

subplot(2,2,2);
stem((0:1:15),x4_16,'filled')
xlabel('n');
ylabel('x4(n)');

subplot(2,2,4);
stem((0:1:15),X4_16,'filled');
xlabel('k');
ylabel('|X4(k)|');