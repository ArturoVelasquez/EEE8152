Tc=0.001;
t=0:Tc:2;
Ts=0.1;
%Ts=0.05;
%Ts=0.04;
s_vec=0:Ts:2;

y1=sin(2*pi*t);
y1_sample=sin(2*pi*s_vec);
y2=sin(18*pi*t+pi); % 9 hertz + phase shift
y2_sample=sin(18*pi*s_vec+pi);
y3=sin(22*pi*t); % 11 hertz
y3_sample=sin(22*pi*s_vec);

figure("Name","1 Hz")
hold on
plot(t,y1)
stem(s_vec,y1_sample,'C')
hold off

figure("Name","9 Hz and phase shift")
hold on
plot(t,y2)
stairs(s_vec,y2_sample)
hold off

figure("Name","11 Hz")
hold on
plot(t,y3)
stairs(s_vec,y3_sample)
hold off

figure("Name","All samplings")
hold on
stairs(s_vec,y1_sample)
stairs(s_vec,y2_sample)
stairs(s_vec,y3_sample)
legend({'x1(t)','x2(t)','x3(t)'},'Location','southwest')
hold off