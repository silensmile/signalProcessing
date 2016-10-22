clear;
[y, Fs, nbits] = wavread('EverglowCut.wav');
yleft = y(:,1);
dis500 = 0.5*sin(1000*pi*(1:length(yleft))/Fs)';
dis1000 = 0.5*sin(2000*pi*(1:length(yleft))/Fs)';
dft = abs(fft(yleft,4410));
disdft1 = abs(fft(dis500,4410));
disdft2 = abs(fft(dis1000,4410));

fp = 900;
fb = 1100;
wp = 2*fp / Fs;
ws = 2*fb / Fs;
f = [0 wp wp+2*90/Fs ws-2*90/Fs ws 1];
m = [1 1 0 0 1 1];
b = fir2(5000,f,m);

%freqz(b,1,4096,Fs)
final1000 = filter(b,1, yleft + dis1000);

subplot(2,1,1);
pic = stem(linspace(0,44100,4410),[dft+disdft2,...
    [zeros(1,100),dft(101)+disdft2(101),zeros(1,4209),dft(4311)+disdft2(4311),zeros(1,99)]']);
ylim([0 1200]);
xlim([0 44100/8]);
pic(1).Color = 'b'; 
pic(1).Marker = 'none';
pic(2).Color = 'r'; 
pic(2).Marker = 'none';

subplot(2,1,2);
Final1000 = abs(fft(final1000,4410));
pic = stem(linspace(0,44100,4410),[Final1000,...
    [zeros(1,100),Final1000(101),zeros(1,4209),Final1000(4311),zeros(1,99)]']);
pic(1).Color = 'b'; 
pic(1).Marker = 'none';
pic(2).Color = 'r'; 
pic(2).Marker = 'none';
xlim([0 44100/8]);

% sound(yleft+dis1000, 44100)
% sound(final1000, 44100)