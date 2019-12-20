f0=1000;
N=[1,2,3,4,5,10]
fs=200;
dur=2*pi;
t=0:1/fs:dur;
clear;
f0=100;
N=[5,10,15]
fs=200;
dur=2*pi;
t=0:1/fs:dur;

for i=1:6
for k=1:N(1)
    f(k)=5*f0;
end
for k=1:N(1)
    X(k)=j*4/(k*pi);
end
x(i,:)=syncos(f,X,fs,dur);
subplot(3,2,i);plot(t,x(i,:));
end