function [ABadd] = dilation(oldA,B)
% add boundary back
% [ABadd] = dilation(A,B)


[rowB,colB] = size(B);
[rowA0,colA0] = size(oldA);
B1 = flipud(B);
B1 = fliplr(B1);

%find the center of B
midRow = round(rowB/2);
midCol = round(colB/2);
centerB = B1(midRow, midCol);

% disR shoud be equal to disC
disR = midRow-1;% distance from center of B to the left/right edge
disC = midCol-1;% distance from center of B to the upper/lower edge

% extend matrix A
% Zero-padding extension 2-D.
% here i modified the function i built for prob1.7a
% % % % A = zeros(rowA0+disR,colA0+disC);
% % % % [A] = RotTransImage(oldA, 0, disC, disR);
A = oldA;
[rowA,colA] = size(A);

spotsB1 = find(B1);

ABadd = zeros(rowA,colA);
for col = midCol : colA - disC
    for row = midRow : rowA - disR
        AforComparison = imcrop(A,[col-disC row-disR 2*disC 2*disR]);
        if find(AforComparison(spotsB1)==1)
            ABadd(row,col) = 1;
        end
    end
end

% chop off zero paddings
% ABadd0 should be the same size as origianl image A
% ABadd0 = imcrop(ABadd,[1+disC 1+disR colA0-1 rowA0-1]);