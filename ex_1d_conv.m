N = 17;
m = (-10:20)';

f = buildshift_f(-m,0);
h = buildh(m);
figure(1);clf
subplot(211);stem(m,f);
xlabel('m');title('f(m)')
subplot(212);stem(m,h);
xlabel('m');title('h(m)')


figure(2)
m = (-10:20);
cnt = 1;
nall = -2:15;
y = zeros(length(nall),1);
for n = nall
  f = buildshift_f(m,n);
  h = buildh(m);
  y(cnt) = sum(f.*h); cnt = cnt+1; 
  subplot(211);stem(m,f,'g');hold on
  stem(m,h);hold off
  title(['n=',num2str(n)]);
  xlabel('m')
  subplot(212);stem(nall,y)
  axis([-2 16 0 4])
  xlabel('n')
  pause;
end
