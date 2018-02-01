% Size of initial image
M = 10; N = 3;
% Box of ones, M rows and N columns
f = ones(M,N);
u = linspace(-2,2,255)'; v = u; 
[U V] = meshgrid(u,v);
F = zeros(length(u),length(v));

% Brute force ebaluation of 2D DTFT over many periods
for m = 1:M
  for n = 1:N
    F = F + f(m,n)*exp(-j*2*pi*(U*m + V*n));
  end
end
F = F.';

% Plot the image and the DTFT
figure(1);clf
imagesc(f);axis image;colorbar

figure(2);clf
imagesc(u,v,abs(F));colorbar;axis ij
xlabel('v');ylabel('u')
title('DTFT')

% Compute various size DFTs
% First = size of the image
F_10_3 = fft2(f,10,3);
u_10_3 = -0.5+(0:9)/10;v_10_3 = -0.5+(0:2)/3;

% Oversample a bit
F_20_20 = fft2(f,20,20);
u_20_20 = -0.5+(0:19)/20;v_20_20 = -0.5+(0:19)/20;

% Oversample a lot
F_128_128 = fft2(f,128,128);
u_128_128 = -0.5+(0:127)/128;v_128_128 = -0.5+(0:127)/128;

% Now compute the inverse DFTS of the critically sampled and oversampled
% versions of the signal
f_10_3 = ifft2(F_10_3);
f_20_20 = ifft2(F_20_20);
f_128_128 = ifft2(F_128_128);

% Plot the inverse 2D DFTs to see zero padding
figure(3);clf
subplot(221);imagesc(f);colorbar
subplot(222);imagesc(real(f_10_3));colorbar
subplot(223);imagesc(real(f_20_20));colorbar
subplot(224);imagesc(real(f_128_128));

% Plot the DFTs to see oversampling.  
figure(4);clf
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