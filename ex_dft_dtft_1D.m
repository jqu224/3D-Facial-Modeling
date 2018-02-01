clear all


x = [1 -4 3 2 3 2 -2 -3 2 3 4 -1]';
x = 1+(0:4)';

n = 0:length(x)-1

[X1 W1] = dtft(x,length(x));
[X2 W2] = dtft(x,2*length(x));
[X4 W4] = dtft(x,4*length(x));
[Xc Wc] = dtft(x,100*length(x));

figure(1);clf
stem(n,x,'markersize',10,'markerfacecolor','red');
title('x(n)');xlabel('x')

figure(2);clf
subplot(311);plot(Wc,abs(Xc));hold on; stem(W1,abs(X1),'markersize',10,'markerfacecolor','red')
legend('|X(e^{j\omega})|','|X(k)|')
title('DFT 1 x length(x) vs. DTFT')
xlabel('\omega')
subplot(312);plot(Wc,abs(Xc));hold on; stem(W2,abs(X2),'markersize',10,'markerfacecolor','red')
legend('|X(e^{j\omega})|','|X(k)|')
title('DFT 2 x length(x) vs. DTFT')
xlabel('\omega')
subplot(313);plot(Wc,abs(Xc));hold on; stem(W4,abs(X4),'markersize',10,'markerfacecolor','red')
legend('|X(e^{j\omega})|','|X(k)|')
title('DFT 4 x length(x) vs. DTFT')
xlabel('\omega')

x1 = ifft(X1); n1 = 0:length(x1)-1;
x2 = ifft(X2); n2 = 0:length(x2)-1;
x4 = ifft(X4); n4 = 0:length(x4)-1;

figure(3);clf
subplot(311);stem(n1,x1,'markersize',10,'markerfacecolor','red');
axis([0 length(x4) min(0,min(x))-0.5 max(x)])
title('ifft(X1)')
subplot(312);stem(n2,x2,'markersize',10,'markerfacecolor','red');
axis([0 length(x4) min(0,min(x))-0.5 max(x)])
title('ifft(X2)')
subplot(313);stem(n4,x4,'markersize',10,'markerfacecolor','red');
axis([0 length(x4) min(0,min(x))-0.5 max(x)])
title('ifft(X4)')








