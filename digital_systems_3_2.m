Ts = 0.1;
%define function of s for H(s)=4/(s+4)
numerator = [4];
denumerator = [1,4];
Hs1 = tf(numerator,denumerator);
Hz1 = c2d(Hs1,Ts,'zoh');

figure("Name","Hz vs Hs")
hold on
step(Hs1)
step(Hz1)
legend('Hs1','Hz1')
hold off

%Testing other tf commands
z = tf('z',Ts);
Hz2 = 0.3297/(z*(1-0.6703/z));
figure("Name","test methods for Hz")
hold on
step(Hz1,'C')
step(Hz2)
legend('Hz1','Hz2')
hold off

%Multibock system
ts=0.1;
numeratora=[10];
denominatora=[1,-1];
numeratorb=[10,-10];
denominatorb=[1,4];
Hsa = tf(numeratora,denominatora);
Hza = c2d(Hsa,ts);
Hsb = tf(numeratorb,denominatorb);
Hzb = c2d(Hsb,ts);
%Hsb1=tf(numeratorb,denominatorb,ts);
Fs = series(Hsa,Hsb);
Fz = c2d(Fs,ts,'zoh');
Wz = series(Hza,Hzb)

figure("Name","Composite Blocks")
hold on
step(Fs);
step(Fz);
hold off

figure(Name="Non linearity")
hold on
%step(Fz)
%legend('transform of the sum')
step(Wz)
legend('sum of the transform')
hold off

%Feedback loop
Cz = tf([1,1],[6,-4],ts);
Ps = tf([1],[1,10]);
Pz = c2d(Ps,ts);
Fz1 = series(Cz,Pz);
Hfz =feedback(Fz1,1);

figure("Name","Feedback loop")
hold on
step(Hfz)
hold off

