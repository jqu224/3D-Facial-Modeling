function [H,W]=dtft(h,N)

N = fix(N);
L = length(h);h=h(:);

if (N<L)
  error('DTFT # data samples cannot exceed # frequency samples');
end
W = (2*pi/N)*[0:(N-1)]';
mid = ceil(N/2)+1;
%W(mid:N)=W(mid:N)-2*pi;
H=fft(h,N);
%W=fftshift(W);
%H=fftshift(fft(h,N));
