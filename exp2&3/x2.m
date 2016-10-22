clear;

x2_8 = [1 2 3 4 4 3 2 1];
X2_8 = abs(fft(x2_8,8));
X2_16 = abs(fft(x2_8,16));

figure;
subplot(2,2,1);
stem((0:1:7),x2_8,'filled')
xlabel('n');
ylabel('x2(n)');

subplot(2,2,3);
stem((0:1:7),X2_8,'filled');
xlabel('k');
ylabel('|X2(k)|');

subplot(2,2,2);
stem((0:1:7),x2_8,'filled')
xlabel('n');
ylabel('x2(n)');

subplot(2,2,4);
stem((0:1:15),X2_16,'filled');
xlabel('k');
ylabel('|X2(k)|');