Ts = 0.1;
% Define sampling time
% Define continuous system transfer function a/s+a, where a = 4.
numS1=[4];
denS1=[1,4];
Hs1 = tf(numS1, denS1)
% Define the numerator of the transfer function (tf)
% Define the denominator of the tf
% Define continuous tf, (munerator, denominator)
% Plot step response of H(s)
figure(1)
hold on
step(Hs1,'b')
% define plot
% Plot response of H(s) to a unit step input response.
% Define discrete system tf
numDz1=[1-exp(-4*Ts)];
denDz1 =[1,-exp(-4*Ts)];
Hz1 = tf(numDz1,denDz1,Ts)
% Define the numerator of the discrete tf
% Define the denominator of the discrete tf
% Define discrete tf, (num, den, SAMPLING TIME)
% Plot step response of H(z1)
step(Hz1,'g')
text(1,2,'Hz1 - inc effect of sampling')
% Plot step response
% Label - text(x-axis co-ord, y-axis co-ord, 'text here')
% Define WRONG discrete tf, the effect of sampling is no longer accounted for.
numDz2=[4,0];
denDz2 =[1,-exp(-4*Ts)];
Hz2 = tf(numDz2,denDz2,Ts)
% Define numerator
% Define denominator
% Plot step response of H(z2)
step(Hz2,'r')
% Plot step response
text(1,13,'Hz2 - no account of sampling') % Label- text(x-axis co-ord, y-axis co-ord,'text here')
hold off