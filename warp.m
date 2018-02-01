%% Translate
clear
imbase = ['./images/'];
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
Inew = interp2(X,Y,Iold,Xp,Yp,'linear',0);
Inew3 = interp2(X,Y,Iold,Xp,Yp,'cubic',0);
err = abs(Inew-Inew3);
figure(2);clf
imagesc(x,y,Inew);colormap gray
%imagesc(p,q,g);colormap gray
axis square ; 
% print -d jpeg im_tr.jpg

%% Scaling
clear
imbase = ['./images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;

Xp = 2*X;
Yp = 2*Y;

Inew = interp2(X,Y,Iold,Xp,Yp,'linear',0);
figure(2)
imagesc(x,y,Inew);colormap gray
axis square ; 


Xp = X/2;
Yp = Y/2;

Inew = interp2(X,Y,Iold,Xp,Yp,'linear',0);
figure(3)
imagesc(x,y,Inew);colormap gray
axis square ; 

%% 
% Rotation
clear
imbase = ['./images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;

th = pi/4;
Xp = X*cos(th) - Y*sin(th);
Yp = X*sin(th) + Y*cos(th);
Inew = interp2(X,Y,Iold,Xp,Yp,'linear',255);
figure(2)
imagesc(x,y,Inew);colormap gray
axis square ; 
% print -d jpeg im_rot.jpg
%% Rotate translate
clear
imbase = ['./images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;

th = pi/4;
trans = [nc/2 nr/2];
%trans = [50 0];
Xp = (X-trans(1))*cos(th) - (Y-trans(2))*sin(th)+trans(1);
Yp = (X-trans(1))*sin(th) + (Y-trans(2))*cos(th)+trans(2);
Inew = interp2(X,Y,Iold,Xp,Yp,'linear',255);
figure(2)
imagesc(x,y,Inew);colormap gray
axis square ;
%%
clear
imbase = ['./images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;

% Nonuniform scaling
R = sqrt((X).^2 + (Y).^2);
S = exp(R/500);
Xp = S.*X;
Yp = S.*Y;
Inew = interp2(X,Y,Iold,Xp,Yp,'linear',0);
imagesc(x,y,Inew);colormap gray
axis square ;
% print -d jpeg im_nusc.jpg

%% Nonuniform Rotation
clear
imbase = ['./images/'];
Iold = imread([imbase,'engineer.tif']); Iold = double(Iold);

[nr nc] = size(Iold);
x = (0:nc-1)';
y = (0:nr-1)';
[X,Y] = meshgrid(x,y);

figure(1);clf;colormap gray
imagesc(x,y,Iold);axis square;
R = sqrt((X-nc/2).^2 + (Y-nr/2).^2);
th = R/50;
Xp = (X-nc/2).*cos(th) - (Y-nr/2).*sin(th) + nr/2;
Yp = (X-nc/2).*sin(th) + (Y-nr/2).*cos(th) + nc/2;
Inew = interp2(X,Y,Iold,Xp,Yp,'linear',0);
imagesc(x,y,Inew);colormap gray
axis square ;
% print -d jpeg im_nurot.jpg


%%
% Movie of rotate and scale 
th = linspace(0,2*pi,250);
st = linspace(1,3,250);
for idx = 1:length(th)
  thi = th(idx);
  P = X*cos(thi) + Y*sin(thi);
  Q = -X*sin(thi) + Y*cos(thi);
  P = st(idx)*P;
  Q = st(idx)*Q;
  Inew = interp2(X,Y,Iold,P,Q,'linear',0);
  imagesc(x,y,Inew);
  colormap gray; axis square ; axis xy
  M(idx) = getframe;
end

% Movie of nonuniform rotate and scale 
th = linspace(0,2*pi,100);
st = linspace(1,1.1,100);
R = 1./(1+sqrt(X.^2 + Y.^2));
R = R/max(max(R));
for idx = 1:length(th)
  thi = th(idx);
  P = X.*cos(thi*R) + Y.*sin(thi*R);
  Q = -X.*sin(thi*R) + Y.*cos(2*thi*R);
  P = st(idx)*P;
  Q = st(idx)*Q;
  g = interp2(X,Y,Iold,P,Q,'linear',0);
  imagesc(x,y,g);
  colormap gray; axis square ; axis xy
  M(idx) = getframe;
end
