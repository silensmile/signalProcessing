%% 系统单位脉冲响应产生程序
clear;
n = 0 : 50;
x_a = [ones(1,11),zeros(1,40)];
X_a = fft(x_a);
subplot(1,2,1);
stem(x_a);
subplot(1,2,2);
plot(linspace(-2,2,2*length(n)),[fliplr(X_a),X_a]);