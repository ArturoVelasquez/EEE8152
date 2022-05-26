Tsample = 0.1;              % Define discrete system sampling period

% define plotting range vectors
x = [0:0.05:1]'             % Define vector. Note:   ' transposes vector
N = length(x)               % record length of vector, x.
B = ones(N,1)               % Define vector of ones. Length of array same as x

% constant imag component in s-plane --> radial lines in z plane
a = 0.25                    % 0.001 < a < 1. Constant to vary imag component.
rS1 = -30*x                  % define real part of S plot. --> S < 0
iS1 = j*B*pi*a/Tsample      % Define imag part of S plot.
S1 = rS1 + iS1;             % S1 = a +ib

% constant real component in s plane --> circles in z plane: radius zeta.wn
b = 30                      % 0.001 < b < 30. Constant to vary real component.
rS2 = -b*B                  % real component. c varies constant real part
iS2 = j*pi*x/Tsample        % imag component
S2 = rS2 + iS2;             % S2 = a +ib

% constant undamped natural frequency --> arcs in z plane
c =3.48                  % 0.001 < c < 1. Constant to vary imag component.
phi = x*pi/2;                                   % define angle vector
rS3 = c*(pi/Tsample)*(-cos(phi)+j*sin(phi));    % produce circle. b varies radius.
S3 = rS3;

% constant damping ratio  --> spirals in z plane
d = 1                       % 0.1 < d < 10. Constant to vary imag component.
rS4 = -30*x                 % real component
iS4 = j*30*x*d              % imag component. d varies angle --> atan(iS4/rS4)
S4 = rS4 + iS4;             % S3 = a +ib

% plot results in s plane
figure(1)
hold on
plot(S1,'bo'), sgrid
axis ([-30 0 0 35])
figure(2)
axis ([-30 0 0 35])
hold on
plot(S2,'gx'), sgrid
figure(3)
axis ([-30 0 0 35])
hold on
plot(S3,'m*'), sgrid
figure(4)
axis ([-30 0 0 35])
hold on
plot(S4,'r+'), sgrid

% s to z plane mapping z = exp(sT)
Z1=exp(Tsample*S1);
Z2=exp(Tsample*S2);
Z3=exp(Tsample*S3);
Z4=exp(Tsample*S4);

% plot results in z plane.
figure(5)
hold on
plot(Z1,'bo'), zgrid
figure(6)
hold on
plot(Z2,'gx'), zgrid
figure(7)
hold on
plot(Z3,'m*'), zgrid
figure(8)
hold on
plot(Z4,'r+'), zgrid