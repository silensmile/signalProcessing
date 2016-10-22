clear;

[y, Fs] = audioread('µ¾Ïã.m4a');
player = audioplayer(y,Fs);
y1 = y(:,1);
fftsize = 1024;
pt = fftsize/Fs;
xs = fftsize/4;
xx = log10(1:xs);
h = 2; hh = 2;
M = zeros(floor(length(y1)/fftsize),fftsize/hh);
cput = zeros(1, 1 + floor(length(y1)/fftsize/h));
for i = 1:floor(length(y1)/fftsize)
    temp = abs(fft(y1(1+(i-1)*fftsize:i*fftsize)));
    temp = temp(1:hh:fftsize);
    M(i,:) = (temp').^0.7 / 15;
end
%play(player);
for i = 1:h:floor(length(y1)/fftsize)
    cput((i-1)/h+2) = cputime;
    pic = stem(M(i,1:xs/hh),'k');
    pic.Marker = 'none';
    ylim([0 1]);
    xlim([0 xs/hh]);
    drawnow;
    pause(h*pt - (cput((i-1)/h+2) - cput((i-1)/h+1)));
end