clear
% Some examples of building Gaussian kernel

% Kernel which we get when using "continuous" variance = 0.25
g25 = gauss_kernel(sqrt(0.25));

% Kernel which we get when using "continuous" variance = 0.28
g28 = gauss_kernel(sqrt(0.28));

% Kernel which we get when rounding continuopus variance =0.28
gapx = [1;6;1]/8;
lg = length(g25);

n = (0:lg-1)';

eg25 = sum(n.*g25)/sum(g25);
vg25 = sum(g25.*(n-eg25).^2)/sum(g25);

eg28 = sum(n.*g28)/sum(g28);
vg28 = sum(g28.*(n-eg28).^2)/sum(g28);

egapx = sum(n.*gapx)/sum(gapx);
vgapx= sum(gapx.*(n-egapx).^2)/sum(gapx);

[g25 g28 gapx]
[vg25 vg28 vgapx]
