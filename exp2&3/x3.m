clear;

x3_8 = [4 3 2 1 1 2 3 4];
X3_8 = abs(fft(x3_8,8));
X3_16 = abs(fft(x3_8,16));

figure;
subplot(2,2,1);
stem((0:1:7),x3_8,'filled')
xlabel('n');
ylabel('x3(n)');

subplot(2,2,3);
stem((0:1:7),X3_8,'filled');
xlabel('k');
ylabel('|X3(k)|');

subplot(2,2,2);
stem((0:1:7),x3_8,'filled')
xlabel('n');
ylabel('x3(n)');

subplot(2,2,4);
stem((0:1:15),X3_16,'filled');
xlabel('k');
ylabel('|X3(k)|');