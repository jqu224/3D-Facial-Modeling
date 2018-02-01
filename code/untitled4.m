depth = zeros(length(Xoutput), 3);
depth(:, 1) = Xoutput;
depth(:, 2) = Youtput;
for i = 1 : length(Xoutput)
    depth(i, 3) = img(round(Youtput(i,1)), round(Xoutput(i,1)));
end