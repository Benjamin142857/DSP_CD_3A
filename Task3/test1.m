[x, FS] = audioread('test.m4a');
N = length(x);
N1 = N/2;
n = 1:N;
n1 = 1:N1;
t = n ./ FS;
c = 10*sin(2*pi*4000*t);
c_fft = fft(c);
x1 = x' + c;

x_fft = fft(x);
x1_fft = fft(x1);


subplot(3, 2, 1);
stem(n, x, 'MarkerSize', 1);
title('x')

subplot(3, 2, 2);
stem(n1/pi, abs(x_fft(1:N1)), 'MarkerSize', 1);
title('x_{fft}')

subplot(3, 2, 3);
stem(n, c, 'MarkerSize', 1);
title('noise')

subplot(3, 2, 4);
stem(n1/pi, abs(c_fft(1:N1)), 'MarkerSize', 1);
title('noise_{fft}')

subplot(3, 2, 5);
stem(n, x1, 'MarkerSize', 1);
title('x1')

subplot(3, 2, 6);
stem(n1/pi, abs(x1_fft(1:N1)), 'MarkerSize', 1);
title('x1_{fft}')
