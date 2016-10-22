clear;
omega = -2*pi:0.01:2*pi;
A=1;
a=0.4;
Omega0=2.0734;
n=0:50;
f=1;
T=1/f;
x_a=A*exp(-a*n*T).*sin(Omega0*n*T);
h_b=[1,2.5,2.5,1];
y=conv(x_a,h_b);
Y = zeros(1,length(omega));
for N=1:54
    Y = Y + y(N)*exp(-(N-1)*1i*omega);
end
Y=abs(Y);
subplot(1,2,1);
stem(y);
subplot(1,2,2);
plot(omega/pi,Y);