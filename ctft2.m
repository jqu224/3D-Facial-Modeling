function [F,kx,ky] = ctft2(f,x,y,M,N);

% Computes the 2D CTFT of a signal
%   f = signal samples
%   x,y = space samples.  Assume uniformly spaced
%   N = number of samples in the transform
%   F = fft samples centered at zero frequency
%   w = frequency samples in rad/s


dx = x(2)-x(1);
dy = y(2)-y(1);
if (nargin==3)
  [M N] = size(f);
end

F = fftshift(fft2(f,M,N))*dx*dy;
kx = -(pi/dx)+(0:N-1)'*(2*pi/(N*dx))';
ky = -(pi/dy)+(0:N-1)'*(2*pi/(N*dy))';