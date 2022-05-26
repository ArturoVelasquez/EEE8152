Ts=0.1;
Ps=tf([1],[1,6]);
Pz=c2d(Ps,Ts);
z=tf('z',Ts);
Cz=(1*z-0.1)/(1*z-0.8);
Hz=series(Cz,Pz)/(1+ series(Cz,Pz));
P=pole(Hz);
Preal=real(P);
Pimg=imag(P);
Pmag=abs(P);
Pangle=angle(P);
wd = abs(Pangle/Ts);
[wn,zeta]=damp(Hz)

figure("Name","Hz")
step(Hz)