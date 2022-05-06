clc;
close all;
clear all;
disp('Generate 0.02-second sine wave of 100 Hz');
amp= 4;
fs = 3200; 
T = 1/fs;
t = 0:T:0.02; 
sig1=amp* sin (2*pi*100.*t);
min_sig=min(sig1);
max_sig=max(sig1);
sig = amp* sin (2*pi*100.*t); 
nbits= 4;
quint_level=2^nbits; 
s=(max_sig-min_sig)/quint_level;
for jj=min_sig:s:max_sig
sig(sig<=jj+s& sig>=jj)=((2*jj)+s)/2;
end
figure
stem(sig);
title('Plot of Sampled Signal')
xlabel('Samples Number')
ylabel('Samples')
figure
qun_error=sig1-sig;
plot(qun_error);

title('Plot of Quantization Error')
xlabel('Samples Number')
ylabel('Quantization Error')