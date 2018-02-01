clear all
close all

N = 255;
f = zeros(N,N);
f((N+1)/2,(N+1)/2) = 1;

De = bwdist(f,'euclidean');
D4 = bwdist(f,'cityblock');
D8 = bwdist(f,'chessboard');

figure(1);colormap default
subplot(221); imagesc(f);axis image;colorbar
title('Image')
subplot(222); imagesc(De);axis image;colorbar
title('Euclidean');
subplot(223); imagesc(D4);axis image;colorbar
title('City Block (D4)');
subplot(224); imagesc(D8);axis image;colorbar
title('Chessboard (D8)');

figure(2);clf
hp=plot([De(:,100) D4(:,100) D8(:,100)],'linewidth',2)
set(gca,'FontSize',14)
title('Distance X-form Slices at Column 100')
hl=legend('Euclidean','D4','D8')
hl.FontSize=14;

x = linspace(-1,1,N)';
y = linspace(-1,1,N)';
[X Y] = meshgrid(x,y);
f = abs(X.^2+Y < 1e-2) & abs(X.^2+Y > 1e-3);

De = bwdist(f,'euclidean');
D4 = bwdist(f,'cityblock');
D8 = bwdist(f,'chessboard');


figure(3);colormap default
subplot(221); imagesc(f);axis image;colorbar
title('Image')
subplot(222); imagesc(De);axis image;colorbar
title('Euclidean');
subplot(223); imagesc(D4);axis image;colorbar
title('City Block (D4)');
subplot(224); imagesc(D8);axis image;colorbar
title('Chessboard (D8)');


x = linspace(-1,1,N)';
y = linspace(-1,1,N)';
[X Y] = meshgrid(x,y);
f = abs(X.^2+Y.^2 < .2);

De = bwdist(f,'euclidean');
D4 = bwdist(f,'cityblock');
D8 = bwdist(f,'chessboard');


figure(4);colormap default
subplot(221); imagesc(f);axis image;colorbar
title('Image')
subplot(222); imagesc(De);axis image;colorbar
title('Euclidean');
subplot(223); imagesc(D4);axis image;colorbar
title('City Block (D4)');
subplot(224); imagesc(D8);axis image;colorbar
title('Chessboard (D8)');