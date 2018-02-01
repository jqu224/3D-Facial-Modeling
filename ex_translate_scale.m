%% Translate
clear
imbase = ['../images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;
% % print -d jpeg im1.jpg

% Translation
Xp = X-10.2;
Yp = Y-20.5;
Inew = interp2(X,Y,Iold,Xp,Yp,'linear',255);
Inew3 = interp2(X,Y,Iold,Xp,Yp,'cubic',255);
err = abs(Inew-Inew3);
figure(2);clf
imagesc(x,y,Inew);colormap gray
axis square ; 

%% Scaling
clear
imbase = ['../images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;

Xp = 2*X;
Yp = 2*Y;

Inew = interp2(X,Y,Iold,Xp,Yp,'linear',255);
figure(2)
imagesc(x,y,Inew);colormap gray
axis square ; 


Xp = X/2;
Yp = Y/2;

Inew = interp2(X,Y,Iold,Xp,Yp,'linear',255);
figure(3)
imagesc(x,y,Inew);colormap gray
axis square ; 
