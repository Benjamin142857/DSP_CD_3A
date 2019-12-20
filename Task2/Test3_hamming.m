M=121; %11?41?81?121
n=[0:1:M-1];
wc=0.3*pi;
hd=ideal_lp(wc,M);
w_ham=(hamming(M))';
h_ham=hd.*w_ham;
[db2,mag2,pha2,grd2,w2]=freqz_m(h_ham,[1]);

figure(1);
subplot(2,2,1);
stem(n,hd,'k');
grid;
title('Before window pulse', 'fontsize', 24);
axis([0 M-1 -0.2 0.5]);
ylabel('hd(n)', 'fontsize', 18)

subplot(2,2,2);
stem(n,w_ham,'k');
title('Window', 'fontsize', 24);
axis([0 M-1 0 1.1]);
ylabel('w(n)', 'fontsize', 18)

subplot(2,2,3);
stem(n,h_ham,'k');
grid;
title('After window pulse', 'fontsize', 24);
axis([0 M-1 -0.2 0.5]);
ylabel('h(n)', 'fontsize', 18)

subplot(2,2,4);
plot(w2/pi,db2,'k');
grid;
title('Window magnitude (dB)', 'fontsize', 24);
axis([0 1 -100 10]);
ylabel('Decibels', 'fontsize', 18)

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]);
set(gca,'YTickMode','manual','YTick',[-50,0]);