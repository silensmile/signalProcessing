clear;

[y, Fs] = audioread('µ¾Ïã.m4a');
player = audioplayer(y,Fs);
y1 = y(:,1);
fftsize = 2048;
pt = fftsize/Fs;
xs = fftsize/4;
h = 1;
M = zeros(floor(length(y1)/fftsize)*h,xs);
for i = 1:floor(length(y1)/fftsize)*h
    if (i-1)*fftsize/h+fftsize > length(y1)
        break;
    end
    temp = abs(fft(y1(1+(i-1)*fftsize/h:(i-1)*fftsize/h+fftsize)));
    M(i,:) = temp(1:xs)';
end
M = M.^0.65;
subplot(2,1,1);
plot(y1);
ylim([-1.5 1.5]);
subplot(2,1,2);
surf(M');
shading interp;
view(2);
colormap hot;
xlim([0 4813]); ylim([0 512]);
