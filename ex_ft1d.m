%% Sinusoid example

N = 1e5;
tl = -1000; th = 1000;
t = linspace(tl,th,N)';
f = cos(2*pi*t);
[F w] = ctft(f,t);
t1 = (N/2 - 100):(N/2 + 100);
figure(1);clf
subplot(211);plot(t(t1),f(t1));
xlabel('x');title('f(x)=cos(2 \pi x)')
subplot(212);plot(w/(2*pi),abs(F));
axis([-10 10 0 1000])
xlabel('u');title('|F(u)|')

%print -djpeg ../figures/fourier_1d_sinusoid.jpg


%% Windowed sinusoid

a = .02;
u0 = 1000;
tl = -10; th = 10; N = 100000;
t = linspace(tl,th,N);
win = box(t,-a,a);
f = win.*(cos(2*pi*u0*t));%+cos(2*pi*(u0+70)*t));
[F w] = ctft(f,t);
subplot(211);plot(t,f);
xlabel('x');title('f(x)=cos(2 \pi 500 x)*w(x)')
axis([-.05 .05 -1.1 1.1])
subplot(212);plot(w/(2*pi),abs(F));
xlabel('u');title('|F(u)|')
%print -djpeg ../figures/fourier_1d_windowed_sinusoid.jpg

%% BOX EXAMPLE 
t = linspace(-5,5,512)';
kx = linspace(-50,50,512)';

a = 0.1;
b1 = box(t,-a,a);
B1 = 2*sin(kx*a)./kx;
figure(1);hold off
subplot(211);plot(t,b1);axis([t(1) t(end) -.1 1.1]);xlabel('x')
subplot(212);plot(kx,abs(B1));;xlabel('k_x')
%print -djpeg ../figures/fourier_1d_box.jpg

a = 3;
b2 = box(t,-a,a);
B2 = 2*sin(kx*a)./kx;
figure(2);clf
subplot(221);plot(t,b1);axis([t(1) t(end) -.1 1.1]);xlabel('x')
title('Box a=1')
subplot(222);plot(kx,B1);;xlabel('k_x')
title('Transform of box a=1')
subplot(223);plot(t,b2);axis([t(1) t(end) -.1 1.1]);xlabel('x')
title('Box a=3')
subplot(224);plot(kx,B2);;xlabel('k_x')
title('Transform of box a=3')
%print -djpeg ../figures/fourier_1d_box_scaled.jpg

a = 1;
kx = linspace(-10,10,512)';
b3 = box(t,0,2*a);
B3 = 2*sin(kx*a)./kx .*exp(i*kx*a);
figure(1);clf
subplot(221);plot(kx,real(B3));xlabel('k_x');grid
title('Real')
subplot(222);plot(kx,imag(B3));;xlabel('k_x');grid
title('Imaginary')
subplot(223);plot(kx,abs(B3));xlabel('k_x');grid
title('Magnitude')
subplot(224);plot(kx,angle(B3));;xlabel('k_x');grid
title('Phase')
%print -djpeg ../figures/fourier_1d_box_shifted.jpg

%% Delta function transforms
x1 = [1;zeros(49,1)];
x = kron(ones(10,1),x1);
t = linspace(0,1,length(x))';
[X w] = ctft(x,t);
figure(1);clf
subplot(211);plot(t,x);xlabel('x')
subplot(212);plot(w,abs(X));xlabel('k_x')
%print -djpeg ../figures/fourier_1d_delta_train.jpg


y1 = [1;zeros(24,1)];
y = kron(ones(20,1),y1);
t = linspace(0,1,length(y))';
[Y w] = ctft(y,t);
figure(2);clf
subplot(211);plot(t,y);xlabel('x')
subplot(212);plot(w,abs(Y));xlabel('k_x')
%print -djpeg ../figures/fourier_1d_delta_train_scaled.jpg
