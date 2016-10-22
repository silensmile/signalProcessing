clear; 

n1 = (0 : 15) / 64;
n2 = (0 : 31) / 64;
n3 = (0 : 63) / 64;
x6_16 = cos(8 * pi * n1) + cos(16 * pi * n1) + cos(20 * pi * n1);
x6_32 = cos(8 * pi * n2) + cos(16 * pi * n2) + cos(20 * pi * n2);
x6_64 = cos(8 * pi * n3) + cos(16 * pi * n3) + cos(20 * pi * n3);
X6_16 = abs(fft(x6_16,16));
X6_32 = abs(fft(x6_32,32));
X6_64 = abs(fft(x6_64,64));

figure;
subplot(2,3,1);
stem((0:1:15),x6_16,'.')
xlim([0,15]);
xlabel('n');
ylabel('x6(n)');

subplot(2,3,4);
stem((0:1:15),X6_16,'.');
xlim([0,15]);
xlabel('k');
ylabel('|X6(k)|');

subplot(2,3,2);
stem((0:1:31),x6_32,'.');
xlim([0,31]);
xlabel('n');
ylabel('x(n)');

subplot(2,3,5);
stem((0:1:31),X6_32,'.');
xlim([0,31]);
xlabel('k');
ylabel('|X6(k)|');

subplot(2,3,3);
stem((0:1:63),x6_64,'.');
xlim([0,63]);
xlabel('n');
ylabel('x(n)');

subplot(2,3,6);
stem((0:1:63),X6_64,'.');
xlim([0,63]);
xlabel('k');
ylabel('|X6(k)|');