function [g,T,pin,pout] = heq(f,N)

% Histogram equalization for gray scale image
% with N gray levels

% Size of the input image
[nr nc] = size(f);
% Total number of pixels
n = nr*nc;

% Form the vector of probabilities
pr = zeros(N,1);
for idx = 0:(N-1)
  % This is the key line of code as it finds the number of occuraces of
  % pixel with gray level idx in the image
  pr(idx+1) = sum(sum(f==idx))/n;
end
pin = pr;

% Cumsum form the running sum.  Note that T will run from 0 to 1 since pr
% is a probability mass function.  So, we have to renormalize after
% applying
T = cumsum(pr);

% Apply T to each pixel in the image agnd rescale by N-1 to get in the
% "right" range of pixel values
g = apply_point_transform(f,T);
g = round(g*(N-1));

% HJiust for kicks, compute the histogram of the transformed image
pr = zeros(N,1);
for idx = 0:(N-1)
  pr(idx+1) = sum(sum(g==idx))/n;
end
pout = pr;
T = round(T*(N-1));

%%%%%%%%%%%%%%%%%%%
function g = apply_point_transform(f,T)
% Function to apply the transformation in T to the image f

[nr nc] = size(f);
g = zeros(nr,nc);

% Loop over all the pixels 
for idx1 = 1:nr
  for idx2 = 1:nc
    % Pull out the gray level from f
    r = f(idx1,idx2);
    %Index into T to find the new gray level
    s = T(r+1);
    % Load the new gray level into the output image g
    g(idx1,idx2) = s;
  end
end
