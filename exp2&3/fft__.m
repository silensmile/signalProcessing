[y, Fs] = audioread('Everglow.wav');
player = audioplayer(y,Fs);
y1 = y(:,1);
fftsize = 2048;
play(player);
for i = 1:floor(length(y1)/fftsize)
    temp = abs(fft(y1(1+(i-1)*fftsize:i*fftsize)));
    pic = stem(temp(1:fftsize/4));
    pic.Marker = 'none';
    ylim([0 400]);
    xlim([1 fftsize/4]);
    drawnow;
    pause(0.5*fftsize/Fs);
end