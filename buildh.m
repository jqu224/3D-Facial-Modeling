function [h] = builh(n)
h = zeros(length(n),1);

for idx = 1:length(n)
  if (n(idx)>=0 && n(idx)<=4)
    h(idx) = (0.8)^n(idx);
  end
  
end
