% Assignment 3 -- Part B - Equiripple low pass filter  
% Bipin Kumar
% 170102021
clc;
close all;clear all;

passband_freq = 0.3*pi;  
stopband_freq = 0.4*pi;  
del1=0.05; %Maximum ripple allowed in passband
del2=0.05; %Maximum ripple allowed in stopband
freq=[0;0.3;0.4;1];
%Frequency divided in regions of passband, transition band, stopband
lowpass_weights=[1;1;0;0]; %response amplitudes at each band edge 
weights=[1;1];

% number of coefficients are odd

%% M=21 is the number of coefficients
N=20;
[h,err] = firpm(N,freq,lowpass_weights,weights);
[Hr,W] = Hr_Type1_symm_odd(h); %Hr is the designed filter


figure;
plot(W/pi,Hr,'DisplayName','21');
xlabel('Frequency');
ylabel('Amplitude');
yline(0.05,'--');yline(1.05,'--');yline(-0.05,'--');
yline(0.95,'--');yline(0);yline(1);
xline(0.3,'--');xline(0.4,'--');
xticks([0:0.1:1]);
yticks([-0.05 0 0.05 0.95 1 1.05]);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'});

hold on
%% M=25 is the number of coefficients
N=24;
[h,err] = firpm(N,freq,lowpass_weights,weights); %Uses Parks-McClellan Algorithm
[Hr,W] = Hr_Type1_symm_odd(h); %Hr is the designed filter

 
plot(W/pi,Hr,'DisplayName','25');
 
%% M=29 is the number of coefficients
N=28;
[h,err] = firpm(N,freq,lowpass_weights,weights); %Uses Parks-McClellan Algorithm
[Hr,W] = Hr_Type1_symm_odd(h); %Hr is the designed filter
 
plot(W/pi,Hr,'DisplayName','29');
 
%% M=33 is the number of coefficients
N=32;
[h,err] = firpm(N,freq,lowpass_weights,weights); %Uses Parks-McClellan Algorithm
[Hr,W] = Hr_Type1_symm_odd(h); %Hr is the designed filter
plot(W/pi,Hr,'DisplayName','33');
legend
hold off
 
%% Conclusions

% As we increase M, the maximum error observed in passband and
% stopband reduces, and the length of transition band decreases. 

% Filter obtained by eigenfilter method (Part A) is closer to the 
% desired filter than that obtained by this method.

% But the approximation error is uniformly distributed in both the passband
% and the stopband in equiripple filter, which is not  
% in the case of eigenfilters.Each method has it's own pros and cons.

%Equiripple filter, as the name suggests, has equal ripples in passband
% & stopband, which means the signal distortion that happens at the edge
% of the passband due to presence of a large ripple is avoided in 
% Equiripple design BUT, Equiripple design has a large transition band,
% thus limiting the total passband width.
%On the other hand, in a Least Squares design, the transition band
% width is smaller than for Equiripple design, hence the passband width
%is more, but the passband ripple are not equi-ripple & exhibit a spike at
%the passband edge due to Gibbs phenomenon, which causes signal distortion
%at the edge.
