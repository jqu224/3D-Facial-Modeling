
%% Sobel
clear;

Sx = [1 2 1 ; 0 0 0 ; -1 -2 -1]/8;
Sy = [1 0 -1 ; 2 0 -2 ; 1 0 -1]/8;
f = double(imread('../images/Fig4.11(a).jpg'));
f1 = conv2(f,Sx,'same');
f2 = conv2(f,Sy,'same');

figure(1);clf;colormap(gray)
subplot(221);imagesc(f);axis square
subplot(222);imagesc(abs(f1));axis square
title('Horizontal Sobel Filter')
subplot(223);imagesc(abs(f2));axis square
title('Vertical Sobel Filter')
subplot(224);imagesc(abs(f1+f2)/2);axis square
title('|H + V|/2 Sobel Filter')

f = double(imread('../images/Fig4.20(a).jpg'));
f1 = conv2(f,Sx,'same');
f2 = conv2(f,Sy,'same');

figure(2);clf;colormap(gray)
subplot(221);imagesc(f);axis image
subplot(222);imagesc((f1));axis image;colorbar
title('Horizontal Sobel Filter')
subplot(223);imagesc((f2));axis image;colorbar
title('Vertical Sobel Filter')
subplot(224);imagesc(abs(f1+f2)/2);axis image;colorbar
title('|H + V|/2 Sobel Filter')


%% Laplacian
f = double(imread('../images/Fig4.11(a).jpg'));
L1 = [0 1 0 ; 1 -4 1 ; 0 1 0];
L2 = [1 2 1; 2 -12 2 ; 1 2 1]/4;
f1 = conv2(f,L1,'same');
f2 = conv2(f,L2,'same');
figure(1);clf;colormap(gray)
subplot(221);imagesc(f);axis square
subplot(222);imagesc(f1);axis square
title('Laplacian');colorbar
subplot(223);imagesc(f2);axis square
title('Laplacian Binomial apx');colorbar

f = double(imread('../images/Fig4.20(a).jpg'));
L1 = [0 1 0 ; 1 -4 1 ; 0 1 0];
L2 = [1 2 1; 2 -12 2 ; 1 2 1]/12;
f1 = conv2(f,L1,'same');
f2 = conv2(f,L2,'same');
figure(2);clf;colormap(gray)
subplot(221);imagesc(f);axis square
subplot(222);imagesc(f1);axis square
title('Laplacian');colorbar
subplot(223);imagesc(f2);axis square
title('Laplacian Binomial apx');colorbar

%% Smoothed Laplacian
clear all
h1h = [0.5 0.5]; h1v = h1h';
h1 = h1v*h1h; 
h2 = conv2(h1,h1); 
h4 = conv2(h2,h2); 
h16 = conv2(h4,h4);
L1 = [0 1 0 ; 1 -4 1 ; 0 1 0];
f = double(imread('../images/Fig4.20(a).jpg'));
%f = double(imread('../images/Fig4.11(a).jpg'));
f1 = conv2(conv2(f,h4,'same'),L1,'same'); 
f3 = conv2(conv2(f,h16,'same'),L1,'same');

figure(1);clf;colormap(gray)
subplot(121);imagesc(f1);axis square;colorbar
title('h4, L')
subplot(122);imagesc(f3);axis square;colorbar
title('h16, L')

figure(3);
whichrow = 80;
whichrow = 400;
a = [f1(whichrow,:)' f3(whichrow,:)' ]
plot(a)
title(['Row ',num2str(whichrow)])
legend('h4, L','h16, L')



