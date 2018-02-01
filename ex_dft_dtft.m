M = 10; N = 3;
f = ones(M,N);
u = linspace(-2,2,255)'; v = u; 
[U V] = meshgrid(u,v);
F = zeros(length(u),length(v));
for m = 1:M
  for n = 1:N
    F = F + f(m,n)*exp(-j*2*pi*(U*m + V*n));
  end
end
F = F.';

figure(3);clf
imagesc(f);axis image;colorbar

figure(1);clf
imagesc(u,v,abs(F));colorbar;axis ij
xlabel('v');ylabel('u')
title('DTFT')

u = linspace(-0.5,0.5,255)'; v = u;
[U V] = meshgrid(u,v);
F2 = zeros(length(u),length(v));
for m = 1:M
  for n = 1:N
    F2 = F2 + f(m,n)*exp(-j*2*pi*(U*m + V*n));
  end
end
F2 = F2.';


F_10_3 = fft2(f,10,3);
u_10_3 = -0.5+(0:9)/10;v_10_3 = -0.5+(0:2)/3;

F_20_20 = fft2(f,20,20);
u_20_20 = -0.5+(0:19)/20;v_20_20 = -0.5+(0:19)/20;

F_128_128 = fft2(f,128,128);
u_128_128 = -0.5+(0:127)/128;v_128_128 = -0.5+(0:127)/128;



figure(2);clf
subplot(221);imagesc(u,v,abs(F2));colorbar;
subplot(222);pcolor(v_10_3,u_10_3,abs(fftshift(F_10_3)));colorbar
xlabel('v sampled');ylabel('u sampled')
title('10 x 3 DFT');
axis image
subplot(223);pcolor(v_20_20,u_20_20,abs(fftshift(F_20_20)));colorbar
xlabel('v sampled');ylabel('u sampled')
title('20 x 20 DFT');
axis image
subplot(224);pcolor(v_128_128,u_128_128,abs(fftshift(F_128_128)));colorbar
xlabel('v sampled');ylabel('u sampled')
title('128 x 128 DFT');
axis image