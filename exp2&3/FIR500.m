clear;
[y, Fs, nbits] = wavread('EverglowCut.wav');
yleft = y(:,1);
dis500 = 0.5*sin(1000*pi*(1:length(yleft))/Fs)';
dis1000 = 0.5*sin(2000*pi*(1:length(yleft))/Fs)';
dft = abs(fft(yleft,4410));
disdft1 = abs(fft(dis500,4410));
disdft2 = abs(fft(dis1000,4410));

fp = 400;
fb = 600;
wp = 2*fp / Fs;
ws = 2*fb / Fs;
f = [0 wp wp+90*2/Fs ws-90*2/Fs ws 1];
m = [1 1 0 0 1 1];
b = fir2(5000,f,m);

%freqz(b,1,4096,Fs)
final500 = filter(b,1, yleft + dis500);

subplot(2,1,1);
pic = stem(linspace(0,44100,4410),[dft+disdft1,...
    [zeros(1,50),disdft1(51),zeros(1,4309),disdft1(4361),zeros(1,49)]']);
ylim([0 1200]);
xlim([0 44100/8]);
pic(1).Color = 'b'; 
pic(1).Marker = 'none';
pic(2).Color = 'r'; 
pic(2).Marker = 'none';

subplot(2,1,2);
Final500 = abs(fft(final500,4410));
pic = stem(linspace(0,44100,4410),[Final500...
    [zeros(1,50),Final500(51),zeros(1,4309),Final500(4361),zeros(1,49)]']);
pic(1).Color = 'b'; 
pic(1).Marker = 'none';
pic(2).Color = 'r'; 
pic(2).Marker = 'none';
xlim([0 44100/8]);

%sound(yleft+dis500, 44100)
%sound(final500, 44100)