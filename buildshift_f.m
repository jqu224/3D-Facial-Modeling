function [f] = buildshift_f(m,n)
f = zeros(length(m),1);

for idx = 1:length(m)
  qi = n-m(idx);
  if (qi>=0 && qi<=8)
    f(idx) = 1;
  end
  
end
