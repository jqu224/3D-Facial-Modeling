%% Sobels
N = 128;
Sx = [1 2 1 ; 0 0 0 ; -1 -2 -1]/8;
Sy = [1 0 -1 ; 2 0 -2 ; 1 0 -1]/8;
Hx = fftshift(fft2(Sx,N,N));
Hy = fftshift(fft2(Sy,N,N));

r1 = 0:(N-1);
r2 = -(N/2-1):(N/2);
figure(1);colormap default
subplot(221);surf(r2,r2,abs(Hx));shading interp
xlabel('u');ylabel('v');title('Sobel vertical')
subplot(222);surf(r2,r2,abs(Hy));shading interp
xlabel('u');ylabel('v');title('Sobel horizontal')
subplot(223);plot(r2,abs(Hx(:,128)));
xlabel('v');title('Sobel vertical column 128')
subplot(224);plot(r2,abs(Hx(128,:)));
xlabel('u');title('Sobel vertical row 128')
% print -djpeg ../figures/filt_fourier_sobel.jpg

%% Laplacians
L1 = [0 1 0 ; 1 -4 1 ; 0 1 0];
L2 = [1 2 1; 2 -12 2 ; 1 2 1]/4;
Hx = fftshift(fft2(L1,N,N));
Hy = fftshift(fft2(L2,N,N));

h1h = [0.5 0.5]; h1v = h1h';
h1 = h1v*h1h; 
h2 = conv2(h1,h1);
h4 = conv2(h2,h2); 
h16 = conv2(h4,h4); 
h32 = conv2(h16,h2);


r1 = 0:(N-1);
r2 = -(N/2-1):(N/2);

figure(2);clf;colormap default
subplot(221);imagesc(r2,r2,abs(Hx));axis image
xlabel('l');ylabel('k');title('Laplacian')
subplot(222);imagesc(r2,r2,abs(Hy));axis image
xlabel('l');ylabel('k');title('Binomial Laplacian')
subplot(223);surf(r2,r2,abs(Hx));shading interp
xlabel('l');ylabel('k');title('Laplacian')
subplot(224);surf(r2,r2,abs(Hy));shading interp
xlabel('l');ylabel('k');title('Binomial Laplacian')
% print -djpeg ../figures/filt_fourier_laplacian1.jpg

Hy = fftshift(fft2(L2,N,N).*fft2(h16,N,N));
figure(3);clf
subplot(121);imagesc(r2,r2,abs(Hy));axis image
xlabel('l');ylabel('k');title('LoG (Binomial Laplacian & h16)')
subplot(122);mesh(r2,r2,abs(Hy)); axis vis3d
xlabel('l');ylabel('k');
% print -djpeg ../figures/filt_fourier_laplacian2.jpg

