% This program quantizes a signal to n bits.
% It demonstrates, in simple terms, the operation of a typical ADC.
% This code assumes the signal is normalized; between -1 and +1.
close all % closes any open figures within Matlab
n=1; % Number of ADC bits;
Tsample = 0.001
ts = 0:Tsample:2;
x = sin(2*pi*1*ts) % sampled digital signal

%x=sawtooth(2*pi*1*tc); %...you might wish to try a sawtooth waveform
xn1 = x + 1
xn2 = xn1*2^(n-1);
xn3 = floor(xn2);
xn4=xn3/(2^(n-1));
xn5=xn4-1;
%Signal is shifted, now 0 to 2
%Signal is scaled to ADC range, n = number of bits
%Signal is quantized, floor rounds number down to integer
%Signal is scaled back down, now 0 to 2 (quantized)
%Shift signal down (rounding)
figure(1)
hold on;
stem(x,'b');
hold on;
stem(xn5,'r');
legend('exact','quantized')
title(sprintf('Sampled signal versus Quantized signal'));
hold off
xerror = x - xn5
%Lets look at the quantization error.
figure(2)
stem(xerror,'g');
title(sprintf('Quantization Error'));
ylim([0 1])