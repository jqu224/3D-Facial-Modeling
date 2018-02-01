% close all
% clear all
close all
InputIm = imread('jess.jpg');
InputIm = double(rgb2gray(InputIm));



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
img = imresize(InputIm,[256+1 256+1]);
yy = zeros(257,257);
x1 = round(x);
y1 = round(y);
for r = 1:numel(x)
    yr = round(y1(find(x1 == x1(r))))
    
    if numel(yr) ==2
%         yy = zeros(1,257);
        if sum(sum(yy(x1(r),:)))==0
            
            yy(x1(r),yr(1):yr(2)) = 1;
        end
    elseif numel(yr) >2
        if sum(sum(yy(x1(r),:)))==0
            
            yy(x1(r),yr(1):yr(end-1)) = 1;
        end
    end
%     elseif numel(xr) ==3
%         
end
      
[X,Y] = meshgrid(1:257);



img1 = img.*yy;

mesh(X,Y,img1)