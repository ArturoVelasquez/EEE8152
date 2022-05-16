disp('Zero Order Hold Circuit')
Tcont=0.001
tc=0:Tcont:2;
%A=sin(2*pi*1*tc);
%A = sin(4*pi*1*tc+(pi/4))
A=sin(4*pi*tc+(pi/4))+2*cos(10*pi*tc)

figure(1)
hold on 
plot(tc,A);

Tsample=0.02;
ts=0:Tsample:2;

%As = sin(2*pi*1*ts)
%As =sin(4*pi*1*ts+(pi/4))
As = sin(4*pi*ts+(pi/4))+2*cos(10*pi*ts)

stem(ts,As,'b')
hold off

figure(2)
hold on
plot(tc,A)
stem(ts,As,'g')
stairs(ts,As,'C')
hold off

B = sin(2*pi*1*(tc-Tsample/2))

figure(3)
hold on 
plot(tc,A)
stairs(ts,As,'c')
hold off


