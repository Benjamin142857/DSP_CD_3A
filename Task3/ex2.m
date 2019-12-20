[x, FS] = audioread('test.m4a');
N = length(x);
N1 = N/2;
n = 1:N;
n1 = 1:N1;
t = n ./ FS;
c1 = 10*sin(2*pi*20000*t);
c2 = 10*sin(2*pi*100*t);
x1 = x' + c1 + c2;
x1_fft = fft(x1);
% sound(x',FS);

wp1 = 0.02;
ws1 = 0.01;
wp2 = 0.1;
ws2 = 0.2;
Rp=1;
As=15;
[NN1,Wc1]=buttord(wp1,ws1,Rp,As,'s');
[B1, A1]=butter(NN1, Wc1, 'high');
[NN2,Wc2]=buttord(wp2,ws2,Rp,As,'s');
[B2, A2]=butter(NN2, Wc2, 'low');
[H1,W1]=freqz(B1, A1);
[H2,W2]=freqz(B2, A2);
y=filter(B1, A1, x1'); 
y=filter(B2, A2, y); 
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
title('x1', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 4);
stem(n1/pi, abs(x1_fft(1:N1)), 'MarkerSize', 1);
title('x1_{fft}', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 5);
stem(n, y, 'MarkerSize', 1);
title('y', 'fontsize', 24)
xlabel('n', 'fontsize', 18);

subplot(3, 2, 6);
stem(n1/pi, abs(y_fft(1:N1)), 'MarkerSize', 1);
title('y_{fft}', 'fontsize', 24)
xlabel('n', 'fontsize', 18);


figure(2);
subplot(2, 1, 1);
plot(W1,abs(H1));
title('H_{highpass}(Z) - magnitude');
line([wp1*pi, wp1*pi], [0, 1], 'color', 'r');
line([ws1*pi, ws1*pi], [0, 1], 'color', 'g');
xlabel('\omega', 'fontsize', 18);

subplot(2, 1, 2);
plot(W2,abs(H2));
title('H_{lowpass}(Z) - magnitude');
line([wp2*pi, wp2*pi], [0, 1], 'color', 'r');
line([ws2*pi, ws2*pi], [0, 1], 'color', 'g');
xlabel('\omega', 'fontsize', 18);
