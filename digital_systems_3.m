disp('Zero Order Hold Circuit')
Tcont=0.001;
tc=0:Tcont:2;
A=sin(2*pi*1*tc);
%A = sin(4*pi*1*tc+(pi/4));
%A=sin(4*pi*tc+(pi/4))+2*cos(10*pi*tc);

Tsample=0.5;
ts=0:Tsample:2;

As = sin(2*pi*ts);
%As =sin(4*pi*1*ts+(pi/4));
%As = sin(4*pi*ts+(pi/4))+2*cos(10*pi*ts);
figure('Name','ZOH')
hold on 
plot(tc,A);
stem(ts,As,'b')
hold off

figure('Name','Steps of sampling with ZOH')
hold on
plot(tc,A)
%stem(ts,As,'g')
stairs(ts,As,'C')
hold off

B = sin(2*pi*1*(tc-Tsample/2));

figure(3)
hold on 
plot(tc,A)
stairs(ts,As,'c')
plot(tc,B,'r')
hold off

%New part
% ./ is the command for vector division 
figure(4)
f=[0:1:29];
fr=(1-exp(-j*Tsample*2*pi*f))./(j*2*pi*f);
fr(1)=Tsample;
subplot(2,1,1), plot(f,abs(fr))
subplot(2,1,2), plot(f,angle(fr))
