clear all
% Plotting complex exponentials
A = 1;
phi = 0;%pi/3
omega = pi/10;
sigma = -.1;
n = (-2:25)';


f = A*exp(sqrt(-1)*phi).*exp((sqrt(-1)*omega+sigma).*n);
f1 = (A+1)*exp(sqrt(-1)*phi).*exp((sqrt(-1)*omega+sigma).*n);
f2 = A*exp(sqrt(-1)*(phi+pi/6)).*exp((sqrt(-1)*omega+sigma).*n);
f3 = A*exp(sqrt(-1)*phi).*exp((sqrt(-1)*(2*omega)).*n);
f4 = A*exp(sqrt(-1)*phi).*exp((sqrt(-1)*omega+(sigma-.2)).*n);

figure(1);clf
subplot(221);stem(n,[real(f) real(f1)]);title('Real(f)')
legend('Original','A larger');
subplot(222);stem(n,[imag(f) imag(f1)]);title('Imag(f)')
legend('Original','A larger');
subplot(223);stem(n,[abs(f) abs(f1)]);title('|f|')
legend('Original','A larger');
subplot(224);stem(n,[angle(f) angle(f1)]);title('Arg(f)')
legend('Original','A larger');


figure(1);clf
subplot(221);stem(n,[real(f) real(f2)]);title('Real(f)')
legend('Original','\phi larger');
subplot(222);stem(n,[imag(f) imag(f2)]);title('Imag(f)')
legend('Original','\phi larger');
subplot(223);stem(n,[abs(f) abs(f2)]);title('|f|')
legend('Original','\phi larger');
subplot(224);stem(n,[angle(f) angle(f2)]);title('Arg(f)')
legend('Original','\phi larger');

figure(1);clf
subplot(221);stem(n,[real(f) real(f3)]);title('Real(f)')
legend('Original','\omega larger');
subplot(222);stem(n,[imag(f) imag(f3)]);title('Imag(f)')
legend('Original','\omega larger');
subplot(223);stem(n,[abs(f) abs(f3)]);title('|f|')
legend('Original','\omega larger');
subplot(224);stem(n,[angle(f) angle(f3)]);title('Arg(f)')
legend('Original','\omega larger');

figure(1);clf
subplot(221);stem(n,[real(f) real(f4)]);title('Real(f)')
legend('Original','\sigma larger');
subplot(222);stem(n,[imag(f) imag(f4)]);title('Imag(f)')
legend('Original','\sigma larger');
subplot(223);stem(n,[abs(f) abs(f4)]);title('|f|')
legend('Original','\sigma larger');
subplot(224);stem(n,[angle(f) angle(f4)]);title('Arg(f)')
legend('Original','\sigma larger');
