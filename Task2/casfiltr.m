% casfiltr.n
function y=casfiltr(b0,B,A,x)
%FIR?IIR????????
%b0=????
%B=???bk?K????????
%A=???ak?K????????
%x?????
%y????????
[K,L]=size(B);
N=length(x);
w=zeros(K+1,N);
w(1,:)=x;
for i=1:1:K
    w(i+1,:)=filter(B(i,:),A(i,:),w(i,:));
end
y=b0*w(K+1,:);
end