clear;
[y, Fs, nbits] = wavread('EverglowCut.wav');
yleft = y(:,1);
dis500 = 0.5*sin(1000*pi*(1:length(yleft))/Fs)';
dis1000 = 0.5*sin(2000*pi*(1:length(yleft))/Fs)';
dft = abs(fft(yleft,4410));
disdft1 = abs(fft(dis500,4410));
disdft2 = abs(fft(dis1000,4410));

%处理1000Hz正弦干扰的带阻FIR
fp1 = 900; fp2 = 1100;
fb1 = 999; fb2 = 1001;
Rp = 3; Rs = 50;
wp1 = 2*fp1/Fs; wp2 = 2*fp2/Fs;
ws1 = 2*fb1/Fs; ws2 = 2*fb2/Fs;
Wp = [wp1 wp2]; Ws = [ws1 ws2];
[N, Wc] = buttord(Wp, Ws, Rp, Rs);
[bz, az] = butter(N, Wc, 'stop');
% freqz(bz,az,4096,Fs);
final1000 = filter(bz, az, yleft + dis1000);

subplot(2,1,1);
pic = stem(linspace(0,44100,4410),[dft+disdft2,...
    [zeros(1,100),disdft2(101),zeros(1,4209),disdft2(4311),zeros(1,99)]']);
ylim([0 1200]);
xlim([0 44100/8]);
pic(1).Color = 'b'; 
pic(1).Marker = 'none';
pic(2).Color = 'r'; 
pic(2).Marker = 'none';

subplot(2,1,2);
Final1000 = abs(fft(final1000,4410));
pic = stem(linspace(0,44100,4410),[Final1000,...
    [zeros(1,100),final1000(101),zeros(1,4209),final1000(4311),zeros(1,99)]']);
pic(1).Color = 'b'; 
pic(1).Marker = 'none';
pic(2).Color = 'r'; 
pic(2).Marker = 'none';
xlim([0 44100/8]);
ylim([0 300]);

%sound(yleft+dis1000, 44100)
%sound(final1000, 44100)