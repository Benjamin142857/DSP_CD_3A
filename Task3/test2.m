% butter directly make DigtialFilter
[x, FS] = audioread('test.m4a');
N = length(x);
N1 = N/2;
n = 1:N;
n1 = 1:N1;
t = n ./ FS;
c = 10*sin(2*pi*10000*t);
c_fft = fft(c);
x1 = x' + c;

wp=0.1;
ws=0.2;
Rp=1;
As=15;
[NN,Wn]=buttord(wp,ws,Rp,As,'s');
[B, A]=butter(NN,Wn);


y=filter(B, A, x1'); 
subplot(1, 2, 1);
plot(n, x1);
subplot(1, 2, 2);
plot(n, y);
sound(y,FS)
