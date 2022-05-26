Tsample=1;
N=8;
uk = [1 1 0 0 1 1 0 0]'
yk = [0 0.25 1.20 1.81 1.93 2.52 3.78 4.78]'

Y=yk(2:N)
yk_1 = -yk(1:N-1)
uk_1 = uk(1:N-1)
F = [(yk_1),(uk_1)]

Theta=inv(F'*F)*F'*Y
