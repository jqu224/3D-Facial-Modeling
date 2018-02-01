% % % % % % % % % % % % % % % % %
% % % % Final Project % % % % % %
% % % % Problem Set 6, DIP  % % %
% % % % % % % % % % % % % % % % %
% % % % % Jiacheng Qu % % % % % % 
% % % % % % % % % % % % % % % % %
close all
clear all

InputIm = imread('jess.jpg');
[M,N,c] = size(InputIm);
%
N = 256;
M = 256;
img = imresize(InputIm,[M N]);
grayIm = double(rgb2gray(img));

YCBCR = (rgb2ycbcr(img));
figure
subplot(221)
imagesc(YCBCR);
YCBCR = double(YCBCR);
% m = [mean(mean(YCBCR(:,:,2)));  mean(mean(YCBCR(:,:,3)))];

title('Image in YCbCr Color Space');
% InputIm = double(rgb2gray(InputIm));

% C = [77 10;10 119];
 m = [107;147];
%  m = [106;146];
temp1 = YCBCR(:,:,2)-m(1);
temp2 = YCBCR(:,:,3)-m(2);
x_m = [temp1(:),temp2(:)]';
%
% C = (x_m*x_m')./256/256;
C = [36 5;5 53];
invC = inv(C);
for n = 1:numel(temp1)
    P(n) = exp(-0.5*x_m(:,n)'*invC*x_m(:,n));
end
P = reshape(P,M,N);
subplot(222)
imagesc(P);

subplot(223)
P(P<abs(mean(P(:))-2*std(P(:)))) = 0;
P = ~~P;
B = ones(31);
[ABadd] = dilation(P,B);
[ABsub] = erosion(ABadd,B);

B2 = ones(11);
[ABsub] = dilation(ABsub,B2);
% B2 = ones(5);
% [ABsub] = dilation(ABsub,B2);


imagesc(ABsub);

%
subplot(224)
grayIm = double(rgb2gray(img));
imagesc(grayIm.*ABsub)

%% 
figure
temprow = find(ABsub(:));
col1 = temprow(1);
[r1,c1] = m2rc(col1,M,N);

col2 = temprow(end);
[r2,c2] = m2rc(col2,M,N);

ABsubtranspose = ABsub';
temprowtrans = find(ABsubtranspose(:));
row1 = temprowtrans(1);
[r1,r11] = m2rc(row1,M,N);

row2 = temprowtrans(end);
[r2,r22] = m2rc(row2,M,N);
multiplied_im = grayIm.*ABsub;


newimage = multiplied_im(r11:r22,c1:c2);

% [rrr,ccc] = find(ABsub==1);
% mcc= mean(ccc(:));
% stcc = std(ccc(:));
% newimage = multiplied_im(r11:r22,mcc-2*stcc:mcc+2*stcc);
% aaaa = histogram(ccc);
% aaaa = find(ABsub==1);
% aaaa.BinEdges


imagesc(newimage)



% InputIm = imread('jess.jpg');
% img = imresize(InputIm,[256 256]);

% colormap gray
% x_m = x-m;
P = 
%% 

% SNAKE_DEMO Demo showing the usage of snake
% CMP Vision Algorithms http://visionbook.felk.cvut.cz
% Examples
%
% The first example shows how to use snakes to find the inner boundary of the
% heart cavity in a magnetic resonance image
% The initial position of the snake
% is a small circle located inside the cavity. We will make the snake
% expand until it reaches the bright wall.

% img = imread('ps06s117_fig3.jpg');
% img = rgb2gray(img);
img = imresize(InputIm,[256 256]);
img = max(abs(img(:)))-img;


t = [0:0.5:2*pi]';
x = 118 + 3*cos(t);y =  166 + 3*sin(t);
% x = 325 + 10*cos(t);y =  145 + 10*sin(t);

% To show the initial position, you can use the following code:

figure(1) ;
imagesc(img);  colormap(gray);  axis image;  axis off;  hold on;
plot( [x;x(1,1)], [y;y(1,1)], 'r', 'LineWidth',2 );  hold off;
%exportfig(gcf,'output_images/snake_input1.eps') ;

% The external energy is a smoothed version of the image, normalized for
% convenience

h = fspecial( 'gaussian', 20, 1 );
f = imfilter( double(img), h, 'symmetric' );
f = f-min(f(:));  f = f/max(f(:));

figure(2) ;
imagesc(f) ; colormap(jet) ; colorbar ;
axis image ; axis off ;
%exportfig(gcf,'output_images/snake_energy1.eps') ;

% The external force is a negative gradient of the energy.
% We start the snake evolution with alpha=0.1, beta=0.01,
% kappa=0.2, lambda=0.05.
% Note that the normalization constant is incorporated into kappa.


% The final position of the snake is shown
% We can see that the boundary is well
% recovered. It is instructive to run the snake evolution for different
% values of the parameters and note how the evolution speed and the final
% shape changes. Start with small changes first; big changes make the
% snake behave in unpredictable ways.

tic
alpha = .25;
beta = .31;
nk = 1;
lambda = 0.35;
maxstep = 0.4;
displ = 1;

if 1,
  [px,py] = gradient(-f);
  figure(2);
  imagesc(px.^2+py.^2)
  kappa=1/max(abs( [px(:) ; py(:)])) ;
  
  [x,y]=snake(x,y,alpha,beta,nk*kappa,lambda,px,py,maxstep,displ,img);
  
  figure(3) ;
  clf ; 
  imagesc(-[px.^2+py.^2])
  
 colormap(gray) ; 
  hold on ;
  axis image ; axis off ;
  plot([x;x(1)],[y;y(1)],'r','LineWidth',2) ; hold off ;
  pause(1)
  %exportfig(gcf,'output_images/snake_output1.eps') ;
  
end

str = (['alpha = [ ',num2str(alpha),' ], beta = [ ',num2str(beta),...
    ' ], kappa = [ ',num2str(nk*kappa),' ], lambda = [ ',num2str(lambda),...
    ' ], maxstep = [ ',num2str(maxstep),' ], displ = [ ',num2str(displ),' ]']); title(str);
toc
return

