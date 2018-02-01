clear
%% Box filters
f = double(imread('../images/Fig4.11(a).jpg'));

f1 = conv2(f,ones(1,15)/15,'same');
f2 = conv2(f,ones(15,1)/15,'same');
f3 = conv2(f,ones(15,15)/225,'same');
f4 = conv2(f,ones(5,5)/25);

figure(1);clf;colormap(gray)
subplot(221);imagesc(f);axis square
subplot(222);imagesc(f1);axis square
title('1 x 15 box filter')
subplot(223);imagesc(f2);axis square
title('15 x 1 box filter')

figure(2);clf;colormap(gray)
subplot(221);imagesc(f);axis square
subplot(222);imagesc(f3);axis square
title('15 x 15 box filter')
subplot(223);imagesc(f4);axis square
title('5 x 5 box filter')

%% Binomial filters

h1h = [0.5 0.5];   % Length 2
h1v = h1h';
h1 = h1v*h1h;        %  2 x  2
h2 = conv2(h1,h1);   %  3 x  3
h4 = conv2(h2,h2);   %  5 x  5
h8 = conv2(h4,h4);   %  9 x  9
h10 = conv2(h8,h2);  % 11 x 11

n = -10:10; m = n;
[M N] = meshgrid(m,n);
g = exp(-0.5*(M.^2 + N.^2)/3);
g = g/sum(g(:));

f = double(imread('../images/Fig4.20(a).jpg'));
[nr nc] = size(f);
f = f+100*randn(nr,nc);
f1 = conv2(f,h1,'same');
f2 = conv2(f,h2,'same');
f3 = conv2(f,h4,'same');
f4 = conv2(f,h8,'same');

figure(1);clf;colormap(gray)
imagesc(f);axis image

figure(2);clf;colormap(gray)
subplot(221);imagesc(f1);title('h1');axis image
subplot(222);imagesc(f2);title('h2');axis image
subplot(223);imagesc(f3);title('h4');axis image
subplot(224);imagesc(f4);title('h16');axis image


figure(3);
subplot(221);imagesc(twodzeropad(h4,19,19));
title('h4');colorbar
subplot(222);imagesc(twodzeropad(h8,19,19));colorbar
title('h8');colorbar
subplot(223);imagesc(twodzeropad(h10,19,19));colorbar
title('h9');colorbar
subplot(224);imagesc(twodzeropad(g,19,19));colorbar
title('Gaussian, \sigma^2=3');colorbar


return

f = double(f);
F = fftshift(fft2(f));
[M N] = size(f);
[M1 N1] = meshgrid(1:M,1:N);
H = sqrt((M1-M/2).^2 + (N1-N/2).^2) < 200;
H = double(H);
G = H.*F;
g = real(fftshift(ifft2(fftshift(G))));
h = real(fftshift(ifft2(fftshift(H))));
imagesc(fftshift(g))
colormap(flipud(gray))
