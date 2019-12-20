b0=2;
B=[1 -1.33 0.66;1 1.33 0.66];
A=[1 -0.4 0.5;1 0.4 0.5];
N=64;
n=1:N;
x=[(n-1)==0];
h_cas=casfiltr(b0,B,A,x);
subplot(2,1,1)
stem(n,h_cas,'filled','k');
axis([0,25,-4,6]);
title('Cascade', 'fontsize', 24);
[b,a]=cas2dir(b0,B,A);
hdir=filter(b,a,x);
subplot(2,1,2)
stem(n,hdir,'filled','k');
axis([0,25,-4,6]);
title('Direct', 'fontsize', 24);