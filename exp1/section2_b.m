%% 单位脉冲响应序列产生程序
clear;
omega= -2*pi:0.01:2*pi; 
x_b = [1,0];
h_b = [1,2.5,2.5,1];
y = conv(x_b , h_b);
X_b = 1;
H_b = 1 + 2.5*(exp(-1i*omega)+exp(-2i*omega))+exp(-3i*omega);
H_b = abs(H_b);
subplot(2,3,1);
stem(h_b);
Y = 1 + 2.5*(exp(-1i*omega)+exp(-2i*omega))+exp(-3i*omega);
Y = abs(Y);
subplot(2,3,2);
stem(x_b);
subplot(2,3,3);
stem(y);
subplot(2,3,4);
plot(omega/pi,H_b);
subplot(2,3,5);
plot(omega/pi , X_b*ones(1,length(omega)));
subplot(2,3,6);
plot(omega/pi, Y);



