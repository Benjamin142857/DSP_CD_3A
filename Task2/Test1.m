N=64;
n=1:N;
b=[1,-3,11,-27,18];
a=[16,12,2,-4,-1];
x=[(n-1)==0];
hdir=filter(b,a,x);
[b0,B,A]=dir2cas(b,a);
hcas=casfiltr(b0,B,A,x);


figure(1);
stem(n,hdir,'filled');
title('Direct', 'fontsize', 18);

figure(2);
stem(n,hcas,'filled');
title('Cascade', 'fontsize', 18);

