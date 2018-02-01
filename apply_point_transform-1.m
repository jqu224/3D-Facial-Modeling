function g = apply_point_transform(f,T)

[nr nc] = size(f);
g = zeros(nr,nc);

for idx1 = 1:nr
  for idx2 = 1:nc
    r = f(idx1,idx2);
    s = T(r+1);
    g(idx1,idx2) = s;
  end
end
