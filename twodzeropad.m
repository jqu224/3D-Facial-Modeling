function g = twodzeropad(f,M,N)

% Function to zero pad f out to an M by N image

[m n] = size(f);
M1 = (M-m)/2;
N1 = (N-n)/2;

z11 = zeros(M1,N1); z12 = zeros(M1,n); z13 = zeros(M1,N1);
z21 = zeros(m,N1);                     z23 = zeros(m,N1);
z31 = zeros(M1,N1); z32 = zeros(M1,n); z33 = zeros(M1,N1);

g = [z11 z12 z13 ; z21 f z23 ; z31 z32 z33];