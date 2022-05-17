Ts=0.01;
Ys=[4]; %factores del polinomio
Xs=[1,4];
Hs=tf(Ys,Xs);
figure(1)
hold on
step(Hs,'b')

% a=4 y z=1
Yz1=[1-exp(-4*Ts)];
Xz1=[1,-exp(-4*Ts)];
Hz1=tf(Yz1,Xz1,Ts);
step(Hz1,'g')
text(1,2,'Hz - including sampling effects')

Yz2=[4,0];
Xz2=[1,-exp(-4*Ts)];
Hz2=tf(Yz2,Xz2,Ts);

step(Hz2,'r')
text(1,13,'Hz2 -no account of sampling')
hold off