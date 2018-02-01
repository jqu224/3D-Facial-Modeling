clear

% Read input image
f = imread('../images/Fig4.30(a).jpg');
f = imread('../images/cameraman.tif');
%f = imread('../images/engineer.tif');
%f = imread('../images_chapter_03/Fig3.15(a)3.jpg');
f = double(f);


%% Negative
[nr nc] = size(f);

r = 0:255;
T = 255-r;
g = apply_point_transform(f,T);
figure(1);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(g);axis square;colormap(gray)
subplot(212);plot(0:255,T);axis square;axis([0 255 0 255])
xlabel('Input gray level');ylabel('Output gray level')

%print -djpeg ../figures/enhance_negative.jpg

%% Log transform
r = 0:255;
c = 255/log(256);
T = c*log(1+r);
g = apply_point_transform(f,T);
figure(1);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(g);axis square;colormap(gray)
subplot(212);plot(0:255,T);axis square;axis([0 255 0 255])
xlabel('Input gray level');ylabel('Output gray level')
%print -djpeg ../figures/enhance_log.jpg

%% Power law
gamma = 2;
r = 0:255;
c = 255/(256^gamma);
T = c*r.^gamma;
g = apply_point_transform(f,T);
figure(1);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(g);axis square;colormap(gray)
subplot(212);plot(0:255,T);axis square;axis([0 255 0 255])
xlabel('Input gray level');ylabel('Output gray level')
%print -djpeg ../figures/enhance_power.jpg

%% Contrast stretch
r1 = 25; r2  = 20;
s1 = 200; s2 = 20;

for r = 0:255
  if (r<r1)
    T(r+1) = s1/r1*r;
  elseif (r>r2)
    T(r+1) = s2 + (255-s2)/(255-r2)*(r-r2);
  else
    T(r+1) = s1 + (s2-s1)/(r2-r1)*(r-r1);
  end
end
g = apply_point_transform(f,T);

figure(1);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(g);axis square;colormap(gray)
subplot(212);plot(0:255,T);axis square;axis([0 255 0 255])
xlabel('Input gray level');ylabel('Output gray level')
%print -djpeg ../figures/enhance_stretch.jpg



%% Equalization
[g,T,pin,pout] = heq(f,256);
figure(1);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(g);axis square;colormap(gray)
subplot(223);plot(0:255,pin);axis square
subplot(224);plot(0:255,pout);axis square
%print -djpeg ../figures/enhance_histeq1.jpg

figure(2);clf
plot(0:255,T);axis square;axis([0 255 0 255])
xlabel('Input gray level');ylabel('Output gray level')

%print -djpeg ../figures/enhance_histeq2.jpg

return


figure(1);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(h);axis square;colormap(gray)
subplot(223);plot(0:255,T);axis square

figure(2);clf
subplot(221);imagesc(f);axis square;colormap(gray)
subplot(222);imagesc(h);axis square;colormap(gray)
subplot(223);stem(0:255,myhist(f));axis square
subplot(224);stem(0:255,myhist(h));axis square
