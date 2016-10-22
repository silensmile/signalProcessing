clear;

[y, Fs, nbits] = wavread('EverglowCut.wav');
yleft = y(:,1);
dis500 = 0.5*sin(1000*pi*(1:length(yleft))/Fs)';
dis1000 = 0.5*sin(2000*pi*(1:length(yleft))/Fs)';
dft = abs(fft(yleft,4410));
disdft1 = abs(fft(dis500,4410));
disdft2 = abs(fft(dis1000,4410));

subplot(3,1,1);
pic = stem(linspace(0,44100,4410),dft,'b.');
pic.Marker = 'none';
ylim([0 400]);
xlim([0 44100/8]);

subplot(3,1,2);
pic = stem(linspace(0,44100,4410),[disdft1,dft],'.');
pic(1).Color = 'r'; 
pic(1).Marker = 'none';
pic(2).Color = 'b';
pic(2).Marker = 'none';
ylim([0 1200]);
xlim([0 44100/8]);

subplot(3,1,3);
pic = stem(linspace(0,44100,4410),[disdft2,dft],'.');
pic(1).Color = 'r'; 
pic(1).Marker = 'none';
pic(2).Color = 'b'; 
pic(2).Marker = 'none';
ylim([0 1200]);
xlim([0 44100/8]);

% sound(yleft,Fs,nbits)
% sound(yleft+dis500,Fs,nbits)
% sound(yleft+dis1000,Fs,nbits)