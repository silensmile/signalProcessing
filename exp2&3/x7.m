clear;

n1 = 0:7;
n2 = 0:15;
x4_8 = cos(pi / 4 * n1);
x4_16 = cos(pi / 4 * n2);
x5_8 = sin(pi / 8 * n1);
x5_16 = sin(pi / 8 * n2);
x7_8 = x4_8 + x5_8;
x7_16 = x4_16 + x5_16;
X7_8 = abs(fft(x7_8,8));
X7_16 = abs(fft(x7_16,16));
x7_16_NSUBk = [x7_16(1),fliplr(x7_16)];
x7_16_NSUBk(17) = [];

%recover X4 & X5
X4_16 = abs(0.5 * (fft(x7_16) + fft(x7_16_NSUBk)));
X5_16 = abs(0.5 * (fft(x7_16) - fft(x7_16_NSUBk)));

figure;
subplot(2,3,1);
stem((0:1:7),x7_8,'filled')
xlim([0,7]);
xlabel('n');
ylabel('x7(n)');

subplot(2,3,4);
stem((0:1:7),X7_8,'filled');
xlim([0,7]);
xlabel('k');
ylabel('|X7(k)|');

subplot(2,3,2);
stem((0:1:15),x7_16,'filled');
xlim([0,15]);
xlabel('n');
ylabel('x7(n)');

subplot(2,3,5);
stem((0:1:15),X7_16,'filled');
xlim([0,15]);
xlabel('k');
ylabel('|X7(k)|');

subplot(2,3,3);
stem((0:1:15),X4_16,'filled');
xlim([0,15]);
xlabel('n');
ylabel('|X4(n)|');

subplot(2,3,6);
stem((0:1:15),X5_16,'filled');
xlim([0,15]);
xlabel('k');
ylabel('|X5(k)|');
