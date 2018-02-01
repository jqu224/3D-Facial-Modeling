function T = afftrans(source, dest)
%function T = afftrans(source, dest)
% ???????affine transormation? ?? A*X = B????X= A\B?
B =reshape(dest',6,1);   
xr=source(:,1)';
yr=source(:,2)';

A=[xr(1),yr(1),0,0,1,0; 0,0,xr(1),yr(1),0,1; xr(2),yr(2),0,0,1,0; 
   0,0,xr(2),yr(2),0,1; xr(3),yr(3),0,0,1,0; 0,0,xr(3),yr(3),0,1; ];

T=A\B; 