t = linspace(-0.1, 0.1, 100);
x1 = 3*cos(2*pi*10*t+0.1*pi);
x2 = 3*cos(2*pi*10*t-0.2*pi);
x3 = 3*cos(2*pi*10*t+0.3*pi);
x4 = 3*cos(2*pi*10*t-0.6*pi);
x5 = x1 + x2 + x3 + x4;
% hold on
% plot(t, x1, 'r');
% plot(t, x2, 'g');
% plot(t, x3, 'b');
% plot(t, x4, 'm');
% line([0, 0], [-3, 3]);
% xlabel('t', 'fontsize', 22);
% h = legend('x1', 'x2', 'x3', 'x4');
% set(h, 'fontsize', 22);
subplot(3, 2, 1);
plot(t, x1, 'r');
title('x1', 'fontsize', 24);
xlabel('t', 'fontsize', 18);

subplot(3, 2, 2);
plot(t, x2, 'g');
title('x2', 'fontsize', 24);
xlabel('t', 'fontsize', 18);

subplot(3, 2, 3);
plot(t, x3, 'b');
title('x3', 'fontsize', 24);
xlabel('t', 'fontsize', 18);

subplot(3, 2, 4);
plot(t, x4, 'y');
title('x4', 'fontsize', 24);
xlabel('t', 'fontsize', 18);

subplot(3, 2, 5);
plot(t, x5, 'm');
title('x5', 'fontsize', 24);
xlabel('t', 'fontsize', 18);
