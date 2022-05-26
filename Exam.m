Ts=0.1;
al=0.571;
bt=0.512;
K=17.212;
A=1;
B=5.6;
Ps = tf([A],[1,B,0]);
z = tf('z',Ts);
Cz = K*(z-al)/(z-bt);
Pz = c2d(Ps,Ts,'zoh');

Hz=series(Cz,Pz)

figure("Name","Controller")
hold on
step(Hz)
%step(Cz)
hold off

x = [0:0.05:1]'            
N = length(x)              
O = ones(N,1)              

d = 0.6361                      
rS1 = -40*x             
iS1 = j*40*x*d          
S1 = rS1 + iS1; 
S12= rS1 -iS1;
Z1=exp(Ts*S1);
Z12=exp(Ts*S12);

b = 2.857                      
rS3 = -b*O                 
iS3 = j*pi*x/Ts        
S3 = rS3 + iS3;
Z3=exp(Ts*S3);

c = 15                   
phi = x*pi/2;                                  
rS4 =  c*(pi/Ts)*(-cos(phi)+j*sin(phi));   
S4 = rS4;
S41 =c*(pi/Ts)*(-cos(-phi)+j*sin(-phi));
Z4=exp(Ts*S4);
Z41=exp(Ts*S41);


figure(5)
hold on
plot(Z1,'bo'), zgrid
plot(Z12,'bo'), zgrid
plot(Z3,'gx'), zgrid
plot(-Z3,'gx'), zgrid
plot(Z4,'r+'), zgrid
plot(Z41,'r+'), zgrid
hold off

syms l
eqn = 7.5/100==exp(-pi*l/sqrt(1-l^2));
sol = vpa(solve(eqn, l))

%sisotool('rlocus',Pz)