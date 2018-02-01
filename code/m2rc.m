function [r,c] = m2rc(m,R,C)
% m2rc is identical to the following function:
% [r,c] = ind2sub([R,C],m)
% it translates pixels of indec [m] to the row and column number [r,c]
% using fix() and mod() functions

% first use fix() to find the quotient of m/R 
c = fix((m-1)/R) + 1;
% then use mod() to find the remainder of m/R 
% if remainder equals 0 then the number is at the bottom row
% which means r = R
r = mod(m-1,R)+1;
