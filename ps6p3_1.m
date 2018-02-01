% % % % % % % % % % % % % % % % %
% % % % % Problem 3 p1  % % % % %
% % % % Problem Set 6, DIP  % % %
% % % % % % % % % % % % % % % % %
% % % % % Jiacheng Qu % % % % % % 
% % % % % % % % % % % % % % % % %
close all
clear all

% input the image 
InputIm = imread('ps06s117_fig1.jpg');
InputIm = double(rgb2gray(InputIm));

% threshold = 8
% sigma = 4

% use the automatically choosen value of threshold:
% BW1 = edge(InputIm,'Sobel',threshold);
[BW1,threshOut] = edge(InputIm,'Sobel');
threshold = 1/8
[BW2,threshOut1] = edge(InputIm,'log');
% BW2 = edge(InputIm,'log',threshold,sigma);
[BW3,threshOut2] = edge(InputIm,'Canny');
% BW3 = edge(InputIm,'Canny',threshold,sigma);

figure
subplot(131)
imshow(~BW1)
str = (['threshold = [ ',num2str(threshOut),' ]']); title(str);
subplot(132)
imshow(~BW2)
str = (['threshold = [ ',num2str(threshOut1),' ]']); title(str);
xlabel('sigma = 2')
subplot(133)
imshow(~BW3)
str = (['threshold = [ ',num2str(threshOut2),' ]']); title(str);
xlabel('sigma = 2^{1/2}')
