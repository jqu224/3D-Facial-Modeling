clear all;
close all;
%%
% ???

InputIm = imread('jess.jpg');
img = imresize(InputIm,[256 256]);
grayIm = double(rgb2gray(img));

YCBCR = (rgb2ycbcr(img));
figure(1);
subplot(221)
imagesc(YCBCR);
YCBCR = double(YCBCR);

title('Image in YCbCr Color Space');
% InputIm = double(rgb2gray(InputIm));

subplot(222)
C = [77 10;10 119];
m = [107;147];
temp1 = YCBCR(:,:,2)-m(1);
temp2 = YCBCR(:,:,3)-m(2);
x_m = [temp1(:),temp2(:)]';
invC = inv(C);
for n = 1:numel(temp1)
    P(n) = exp(-0.5*x_m(:,n)'*invC*x_m(:,n));
end
P = reshape(P,256,256);
imagesc(P);

subplot(223)
P(P<abs(mean(P(:))-2*std(P(:)))) = 0;
P = ~~P;
B = ones(15);
[ABadd] = dilation(P,B);
[ABsub] = erosion(ABadd,B);

B2 = ones(9);
[ABsub] = dilation(ABsub,B2);
% B2 = ones(5);
% [ABsub] = dilation(ABsub,B2);


imagesc(ABsub);
% ??
subplot(2,2,4);
temprow = find(ABsub(:));
col1 = temprow(1);
[r1,c1] = m2rc(col1,256,256);

col2 = temprow(end);
[r2,c2] = m2rc(col2,256,256);

ABsubtranspose = ABsub';
temprowtrans = find(ABsubtranspose(:));
row1 = temprowtrans(1);
[r1,r11] = m2rc(row1,256,256);

row2 = temprowtrans(end);
[r2,r22] = m2rc(row2,256,256);
multiplied_im = grayIm.*ABsub;
newimage = multiplied_im(r11:r22,c1:c2);
imagesc(newimage)

%% 
% ????
% referenece images
meanshape = double(rgb2gray(imread('meanmale.jpg')));
depthface = double(rgb2gray(imread('face4.jpg')));
load('meanpoints90.mat');
center3 = (meanpoints([33,39,67],:) + meanpoints([36,42,71],:))/2;

% input image
input = newimage;
% input = double(rgb2gray(imread('face3.jpg')));
[R, C] = size(input);

% main part
figure(2);imagesc(input);colormap gray;axis image;
newcenter3 = ginput(3);
xoffset=max(newcenter3(:,1)) - min(newcenter3(:,1)); % ????
yoffset=max(newcenter3(:,2)) - min(newcenter3(:,2)); % ??????
box=[max(1,newcenter3(1,1)-xoffset),max(1,newcenter3(1,2)-yoffset),3*xoffset,3*yoffset ]; % ????????????
newcenter3 = newcenter3-[1;1;1]*box(1:2)+1; % ??x?y????????????????????
T = afftrans(center3, newcenter3);
% ?????????
Xoutput = T(1)*meanpoints(:,1) + T(2)*meanpoints(:,2)+T(5);
Youtput = T(3)*meanpoints(:,1) + T(4)*meanpoints(:,2)+T(6);
img=imcrop(input,box); % ?box????
figure(3);imagesc(img);colormap gray;axis image;
hold on;
temp1 = plot(Xoutput(1:21),Youtput(1:21),'w-',Xoutput(22:31),Youtput(22:31),'w-',Xoutput(53:72),Youtput(53:72),'w-','Linewidth',1);
temp2 = plot(Xoutput,Youtput,'*','Linewidth',4); % ??????
hold off;

%% 
% ??????
while 1
    figure(3);hold on,
    % ????????????????
    [x,y,message]=ginput(1);

    if (message==3)  %Right leg of the mouse    
     break
    end      
    %select the nearest point, ?????
    [val,coor]=min((x-Xoutput).^2 + (y-Youtput).^2);    
    title('Left click for new position,right click to quit ');   
    [x,y,message] = ginput(1);
    Xoutput(coor)=x;  
    Youtput(coor)=y;
      
    delete(temp1);
    delete(temp2);
    temp1 = plot(Xoutput(1:21),Youtput(1:21),'w-',Xoutput(22:31),Youtput(22:31),'w-',Xoutput(53:72),Youtput(53:72),'w-','Linewidth',1);
    temp2 = plot(Xoutput,Youtput,'*','Linewidth',4); % ??????
    drawnow('expose');
end
% ???????Xoutput?Youtput
%% 
figure
load('depth.mat');
% ???????3D
% figure
tri = delaunay(Xoutput,Youtput);
% trisurf(tri,Xoutput,Youtput,depth(:,3));
M = 511;
N = 999;
X = [round(M.*(Xoutput-min(Xoutput))/(max(Xoutput)-min(Xoutput)))+1; M*257/512];
Y = [round(N.*(Youtput-min(Youtput))/(max(Youtput)-min(Youtput)))+1; N*150/512];
Z = [depth(:,3); 205];

Z(Z<mean(Z)-1.5*std(Z)) = mean(Z)-1.5*std(Z);
% Z = Z/2;
tri = delaunay(X,Y);
trisurf(tri,X,Y,Z);
colormap gray
% view([90,55])
% set(gcf, 'Renderer', 'zbuffer');
% 
shading interp
lighting p
% lighting flat
lighting gouraud
camlight
% camlight(90,50)






