t = linspace(-2*pi, 2*pi, 50);

x1 = 2*cos(1000*t+deg2rad(30));
x2 = 4*cos(2000*t+deg2rad(60));
x3 = x1 + x2;

fig = figure();
subplot(3, 1, 1);
plot(t, x1, ':r');
xlabel('t');
ylabel('x1', 'fontsize', 18);
subplot(3, 1, 2);
plot(t, x2, 'og');
xlabel('t');
ylabel('x2', 'fontsize', 18);
subplot(3, 1, 3);
plot(t, x3, 'b');
xlabel('t');
ylabel('x3', 'fontsize', 18);




