clear;

x1_8 = [ones(1,4) , zeros(1,4)];
X1_8 = abs(fft(x1_8,8));
X1_16 = abs(fft(x1_8,16));

figure;
subplot(2,2,1);
stem((0:1:7),x1_8,'filled')
xlabel('n');
ylabel('x1(n)');

subplot(2,2,3);
stem((0:1:7),X1_8,'filled');
xlabel('k');
ylabel('|X1(k)|');

subplot(2,2,2);
stem((0:1:7),x1_8,'filled')
xlabel('n');
ylabel('x1(n)');

subplot(2,2,4);
stem((0:1:15),X1_16,'filled');
xlabel('k');
ylabel('|X1(k)|');