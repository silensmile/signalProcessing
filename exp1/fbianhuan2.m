h_b=[1,2.5,2.5,1];
y=h_b;
Y = zeros(1,length(omega));
for N=1:4
    Y = Y + y(N)*exp(-(N-1)*1i*omega);
end
Y=abs(Y);
subplot(1,2,1);
stem(y);
subplot(1,2,2);
plot(omega/pi,Y);