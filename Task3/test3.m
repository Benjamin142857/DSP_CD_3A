% buttap make AnalogFilter and change
[x, FS] = audioread('test.m4a');
N = length(x);
N1 = N/2;
n = 1:N;
n1 = 1:N1;
t = n ./ FS;
c = 10*sin(2*pi*10000*t);
c_fft = fft(c);
x1 = x' + c;

wp = 0.1*pi;
ws = 0.2*pi;
Wp = 2*FS*tan(wp/2);
Ws = 2*FS*tan(ws/2);
Rp=1;
As=15;
[NN,Wn]=buttord(Wp,Ws,Rp,As,'s');
[Z,P,K]=buttap(NN);
[Bap,Aap]=zp2tf(Z,P,K);
[b,a]=lp2lp(Bap,Aap,Wn);  
[bz,az]=bilinear(b,a,FS);
[H,W]=freqz(bz,az);

figure(1);
y=filter(bz, az, x1'); 
subplot(1, 2, 1);
plot(n, x1);
subplot(1, 2, 2);
plot(n, y);
sound(y,FS)

figure(2);
plot(W,abs(H));
title('H(Z) - magnitude');
line([wp, wp], [0, 1], 'color', 'r');
line([ws, ws], [0, 1], 'color', 'g');


