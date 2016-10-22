clear;

n1 = 0:7;
n2 = 0:15;
x4_8 = cos(pi / 4 * n1);
x4_16 = cos(pi / 4 * n2);
x5_8 = sin(pi / 8 * n1);
x5_16 = sin(pi / 8 * n2);
x8_8 = x4_8 + 1j*x5_8;
x8_16 = x4_16 + 1j*x5_16;
X8_8 = fft(x8_8,8);
X8_16 = fft(x8_16,16);
x8_16_NSUBk = [x8_16(1),fliplr(x8_16)];
x8_16_NSUBk(17) = [];
X8_16_NSUBk = fft(x8_16_NSUBk,16);
X8e_16 = 0.5 * (X8_16 + conj(X8_16_NSUBk));
X8o_16 = -0.5j * (X8_16 - conj(X8_16_NSUBk));

%recover X4 & X5
X4_16 = abs(0.5 * (fft(x8_16) + fft(x8_16_NSUBk)));
X5_16 = abs(0.5 * (fft(x8_16) - fft(x8_16_NSUBk)));

figure;
subplot(2,3,1);
stem((0:1:7),real(x8_8),'filled')
xlim([0,7]);
xlabel('n');
ylabel('x8(n)');

subplot(2,3,4);
stem((0:1:7),abs(X8_8),'filled');
xlim([0,7]);
xlabel('k');
ylabel('|X8(k)|');

subplot(2,3,2);
stem((0:1:15),real(x8_16),'filled');
xlim([0,15]);
xlabel('n');
ylabel('x8(n)');

subplot(2,3,5);
stem((0:1:15),abs(X8_16),'filled');
xlim([0,15]);
xlabel('k');
ylabel('|X8(k)|');

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

%second figure
figure;
subplot(2,2,1);
stem((0:1:15),ifft(X8e_16,16),'filled');
xlim([0,15]);
xlabel('n');
ylabel('IDFT[X8e(k)]');

subplot(2,2,3);
stem((0:1:15),abs(X8e_16),'filled');
xlim([0,15]);
xlabel('k');
ylabel('|X8e(k)|');

subplot(2,2,2);
stem((0:1:15),ifft(X8o_16,16),'filled');
xlim([0,15]);
xlabel('n');
ylabel('IDFT[X8o(k)/j]');

subplot(2,2,4);
stem((0:1:15),abs(X8o_16),'filled');
xlim([0,15]);
xlabel('k');
ylabel('|X8o(k)|');
