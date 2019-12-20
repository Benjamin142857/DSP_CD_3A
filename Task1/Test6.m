f0=100;
N=[5,10,15]
fs=200;
dur=2*pi;
t=0:1/fs:dur;
for k=1:N(1)
    f1(k)=5*f0;
end
for k=1:N(1)
    X1(k)=j*4/(k*pi);
end
x1=syncos(f1,X1,fs,dur);
for k=1:N(2)
    f2(k)=5*f0;
end
for k=1:N(2)
    X2(k)=j*4/(k*pi);
end
x2=syncos(f2,X2,fs,dur);
for k=1:N(3)
    f3(k)=5*f0;
end
for k=1:N(3)
    X3(k)=j*4/(k*pi);
end
x3=syncos(f3,X3,fs,dur);
figure(5);
subplot(3,1,1);plot(t,x1);title('N=5', 'fontsize', 24);
subplot(3,1,2);plot(t,x2);title('N=10', 'fontsize', 24);
subplot(3,1,3);plot(t,x3);title('N=15', 'fontsize', 24);