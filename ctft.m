function [F,w] = ctft(f,t,N);

% Computes the CTFT of a signal
%   f = signal samples
%   t = time samples.  Assume uniformly spaced
%   N = number of samples in the transform
%   F = fft samples centered at zero frequency
%   w = frequency samples in rad/s


f = f(:);
t = t(:);
dt = t(2)-t(1);
if (nargin==2)
  N = length(f);
end

F = fftshift(fft(f,N))*dt;
w = -(pi/dt)+(0:N-1)'*(2*pi/(N*dt))';