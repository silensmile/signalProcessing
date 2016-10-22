clear;
[y, Fs, nbits] = wavread('EverglowCut.wav');
yleft = y(:,1);
dis500 = 0.5*sin(1000*pi*(1:length(yleft))/Fs)';
dis1000 = 0.5*sin(2000*pi*(1:length(yleft))/Fs)';
dft = abs(fft(yleft,4410));
disdft1 = abs(fft(dis500,4410));
disdft2 = abs(fft(dis1000,4410));

%处理500Hz正弦干扰的带阻FIR
fp1 = 400; fp2 = 600;
fb1 = 499; fb2 = 501;
Rp = 3; Rs = 50;
wp1 = 2*fp1/Fs; wp2 = 2*fp2/Fs;
ws1 = 2*fb1/Fs; ws2 = 2*fb2/Fs;
Wp = [wp1 wp2]; Ws = [ws1 ws2];
[N, Wc] = buttord(Wp, Ws, Rp, Rs);
[bz, az] = butter(N, Wc, 'stop');
% freqz(bz,az,4096,Fs);
final500 = filter(bz, az, yleft + dis500);

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