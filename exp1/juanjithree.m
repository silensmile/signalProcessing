A=1;
a=0.4;
Omega0=2.0734;
n=0:50;
f=1;
T=1/f;
x_a=A*exp(-a*n*T).*sin(Omega0*n*T);
y=x_a;
Y1 = zeros(1,length(omega));
for N=1:50
    Y1 = Y1 + y(N)*exp(-(N-1)*1i*omega);
end
h_b=[1,2.5,2.5,1];
y=h_b;
Y2 = zeros(1,length(omega));
for N=1:4
    Y2 = Y2 + y(N)*exp(-(N-1)*1i*omega);
end
Y1=abs(Y1);
Y2=abs(Y2);
Y=Y1.*Y2;
plot(omega/pi,Y);