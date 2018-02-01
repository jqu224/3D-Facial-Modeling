function g =gauss_kernel(sigma)

wt = round(2.5*sigma-0.5);
w = 2*wt+1;
g = zeros(w,1);

for idx = 0:w-1
  g(idx+1) = exp(-(idx-wt)^2/(2*sigma^2));
end
g = g/sum(g);