clf
clear all
close all
% Directory relative to the one I am in where the images files are found.
% YOU MAY NEED TO CHANGE THIS!!
imbase = ['../images/'];

% Read in binary, grayscale, RGB, and indexed images

bi = double(imread([imbase,'circles.tif']));     % Binary
gs = imread([imbase,'cameraman.tif']);   % Grayscale
co = imread([imbase,'flowers.tif']);     % RGB color
[in inmap] = imread([imbase,'emu.tif']); % Indexed color

% Show the images
figure(1);clf
subplot(221);imshow(bi);impixelinfo
subplot(222);imshow(gs);impixelinfo
subplot(223);imshow(co);impixelinfo
subplot(224);imshow(in);impixelinfo

% Show some of the  pixel values.
disp('Binary')
disp(bi(74:80,52:58))
disp('Grayscale')
disp(gs(1:5,1:5))
disp('RGB')
disp(co(1:5,1:5,:))
disp('Indexed')
disp(in(1:5,1:5))

% New figure and look at emu image
figure(2)
imshow(in,inmap);impixelinfo

% Now let's get information about these images
imfinfo([imbase,'circles.tif'])     
imfinfo([imbase,'cameraman.tif'])  
imfinfo([imbase,'flowers.tif'])     
imfinfo([imbase,'emu.tif']) 

%% A bit on imshow and scaling
x = linspace(-1,1,100)';
y = x;
[X Y] = meshgrid(x,y);
f = (X+Y>0).*10*cos(2*pi*X).*sin(3*pi*Y);
f = cos(2*pi*X).*sin(3*pi*Y);
figure(1);clf
subplot(221);imagesc(x,y,f);colorbar
subplot(222);imshow(f);colorbar
subplot(223);imshow(f,[]);colorbar