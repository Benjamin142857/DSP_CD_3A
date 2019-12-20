t = linspace(-3, 3, 200);
x = exp(1i*pi*t) + exp(2*1i*pi*t);

subplot(2, 1, 1);
plot(t, real(x), 'r');
title('real(x)', 'fontsize', 24);
xlabel('t', 'fontsize', 18);


subplot(2, 1, 2);
plot(t, imag(x));
title('imag(x)', 'fontsize', 24);
xlabel('t', 'fontsize', 18);
