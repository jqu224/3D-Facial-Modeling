x= linspace(-10,10,256)';
y = linspace(-10,10,256)';
[X Y] = meshgrid(x,y);

kx = linspace(-20,20,255)';
ky = linspace(-20,20,255)';
[Kx Ky] = meshgrid(kx,ky);
Kx = Kx + 1e-10;
Ky = Ky + 1e-10;

%% Box
close all
a = 1; b = 2;
f1 = box(X,-a,a);
f2 = box(Y,-b,b);
F = 4./((Kx).*(Ky)).*sin(Kx*a).*sin(Ky*b);
figure(1);clf
subplot(211);imagesc(x,y,f1.*f2);colorbar
xlabel('x');ylabel('y');
title('Box');axis square
subplot(212);imagesc(kx,ky,log10(abs(F)));
xlabel('k_x');ylabel('k_y');
title('Transform of box');axis square
% print -djpeg ../figures/fourier_2d_box_ft.jpg

%% Cosine x

close all
kx = linspace(-5,5,255)';
ky = linspace(-1,1,255)';
[Kx Ky] = meshgrid(kx,ky);
Kx = Kx + 1e-10;
Ky = Ky + 1e-10;

f1 = cos(.5*pi*X);
f2 = 1;
[F kx ky] = ctft2(f1.*f2,x,y,length(x),length(y));
figure(1);clf
subplot(211);
imagesc(x,y,f1.*f2);colorbar
xlabel('x');ylabel('y');
title('Cosine');axis square
subplot(212);
imagesc(ky,kx,abs((F)));colorbar
xlabel('k_x');ylabel('k_y');%axis equal
title('Transform of cosine');
% print -djpeg ../figures/fourier_2d_cosine.jpg
%% delta x, sine y

close all
f = zeros(size(X));
f(128,:) = sin(10*y);
f(129,:) = sin(10*y);
[F kx1 ky1]= ctft2(f,x,y);
figure(1);clf
subplot(211);imagesc(x,y,f)
xlabel('x');ylabel('y');title('f(x,y)')
subplot(212);imagesc(kx1,ky1,abs(F));
xlabel('v');ylabel('u')

%% Sin y * Cosine x
close all
x= linspace(-10,10,256)';
y = linspace(-10,10,256)';
[X Y] = meshgrid(x,y);

f1 = cos(2*pi/3*X);
f2 = sin(2*pi/3*Y);
f = f1.*f2;
[F kx ky]= ctft2(f,x,y);

figure(1);clf;
subplot(211);imagesc(x,y,f1.*f2);
xlabel('x');ylabel('y');title('f(x,y)')
subplot(212);mesh(kx,ky,abs(F));
xlabel('v');ylabel('u');title('|F(u,v)|')


%% Disc
close all
x = linspace(-10,10,1024)';
y = linspace(-10,10,1024)';
[X Y] = meshgrid(x,y);

f = double(X.^2 + Y.^2 < a^2);
[F kx ky] = ctft2(f,x,y);

figure(1);clf
subplot(211);imagesc(x,y,f);colorbar
xlabel('x');ylabel('y'); axis([-2 2 -2 2])
title('Circle');axis square
subplot(212);imagesc(kx,ky,abs(F));
xlabel('k_x');ylabel('k_y');axis([-20 20 -20 20])
subplot(212);mesh(kx,ky,abs(F));
xlabel('k_x');ylabel('k_y');axis([-20 20 -20 20 0 3.5])
title('Transform of circle');axis square;


%% Rotate the square
close all
x = linspace(-10,10,256)';
y = linspace(-10,10,256)';
[X Y] = meshgrid(x,y);
kx = linspace(-20,20,256)';
ky = linspace(-20,20,256)';
[Kx Ky] = meshgrid(kx,ky);

theta = pi/3; c = cos(theta); s = sin(theta);

a = 1; b = 2;
f1 = box(X,-a,a).*box(Y,-b,b);
f2 = interp2(X,Y,f1,X*c+Y*s,-X*s+Y*c,'linear',0);

F  = 4./(Kx.*Ky).*sin(Kx*a).*sin(Ky*b);
F2 = interp2(Kx,Ky,F,Kx*c+Ky*s,-Kx*s+Ky*c);

F2c = fftshift(fft2(f2));

figure(1);clf;
subplot(221);imagesc(x,y,f1);axis image
xlabel('x');ylabel('y');title('f(x,y)')
subplot(222);imagesc(x,y,f2); axis image
xlabel('x');ylabel('y');title('f(x,y) rotated')
subplot(223);imagesc(kx,ky,abs(F)); axis image
xlabel('k_x');ylabel('k_y');title('Magnitude of Fourier transform of f(x,y)')
subplot(224);imagesc(kx,ky,abs(F2c));axis image
xlabel('k_x');ylabel('k_y');title('Magnitude of Fourier transform of rotated f(x,y)')
% print -djpeg ../figures/fourier_2d_rotate.jpg

%% Plane wave
x = linspace(-2,2,255)';
y = x;

[X Y] = meshgrid(x,y);

u = 1; v = 1;
figure(1);clf
subplot(221);imagesc(x,y,cos(2*pi*X*u+2*pi*v*Y));
l = line([0,2*u],[0,2*v],'linewidth',3,'color',[1 1 1])
title('Plane wave: Re\{exp(-2 \pi (1 x + 1 y)\})')
xlabel('x');ylabel('y')
axis xy;axis square

u = 1; v = 2;
subplot(222);imagesc(x,y,cos(2*pi*X*u+2*pi*v*Y));
l = line([0,2*u],[0,2*v],'linewidth',3,'color',[1 1 1])
title('Plane wave: Re\{exp(-2 \pi (1 x + 2 y)\})')
xlabel('x');ylabel('y')
axis xy;axis square

u = 0; v = 1;
subplot(223);imagesc(x,y,cos(2*pi*X*u+2*pi*v*Y));
l = line([0,2*u],[0,2*v],'linewidth',3,'color',[1 1 1])
title('Plane wave: Re\{exp(-2 \pi (0 x + 1 y)\})')
xlabel('x');ylabel('y')
axis xy;axis square

u = 1; v = 0;
subplot(224);imagesc(x,y,cos(2*pi*X*u+2*pi*v*Y));
l = line([0,2*u],[0,2*v],'linewidth',3,'color',[1 1 1])
title('Plane wave: Re\{exp(-2 \pi (1 x + 0 y)\})')
xlabel('x');ylabel('y')
axis xy;axis square
% print -djpeg ../figures/fourier_2d_planewaves.jpg


