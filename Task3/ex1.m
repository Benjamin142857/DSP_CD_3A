[x, FS] = audioread('test.m4a');
N = length(x);
N1 = N/2;
n = 1:N;
n1 = 1:N1;
t = n ./ FS;
c = 10*sin(2*pi*20000*t);
x_fft = fft(x);
x1 = x' + c;
x1_fft = fft(x1);
% sound(x',FS);

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
y=filter(bz, az, x1'); 
y_fft = fft(y);
sound(y,FS);


figure(1);
subplot(3, 2, 1);
stem(n, x, 'MarkerSize', 1);
title('x', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 2);
stem(n1/pi, abs(x_fft(1:N1)), 'MarkerSize', 1);
title('x_{fft}', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 3);
stem(n, x1, 'MarkerSize', 1);
title('x1 (x with noise)', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 4);
stem(n1/pi, abs(x1_fft(1:N1)), 'MarkerSize', 1);
title('x1_{fft} (x with noise fft)', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 5);
stem(n, y, 'MarkerSize', 1);
title('y (x1 after filter)', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 6);
stem(n1/pi, abs(y_fft(1:N1)), 'MarkerSize', 1);
title('y_{fft} (x1 after filter fft)', 'fontsize', 24)
xlabel('n', 'fontsize', 18);


figure(2);
plot(W,abs(H));
title('H(Z) - magnitude');
line([wp, wp], [0, 1], 'color', 'r');
line([ws, ws], [0, 1], 'color', 'g');
xlabel('\omega', 'fontsize', 18);
