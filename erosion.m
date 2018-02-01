function [ABsub] = erosion(A,B1)
[rowB,colB] = size(B1);
[rowA,colA] = size(A);

% B1 = flipud(B);
% B1 = fliplr(B1);
%find the center of B
midRow = round(rowB/2);
midCol = round(colB/2);
centerB = B1(midRow, midCol);
disR = midRow-1;% distance from center of B to the left/right edge
disC = midCol-1;% distance from center of B to the upper/lower edge

ABsub = zeros(rowA,colA);
a = 0;
for col = midCol : colA - disC
    for row = midRow : rowA - disR
        AforComparison = imcrop(A,[col-disC row-disR 2*disC 2*disR]);
        if isequal(AforComparison.*B1, B1)
            ABsub(row,col) = 1;
        end
    end
end

