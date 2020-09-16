% Assignment 3
% Part A - Eigenfilter (low pass)
% Name - Bipin Kumar

clc;
close all;clear all;

passband_freq = 0.3*pi; 
stopband_freq = 0.4*pi;

alpha=1;%Weight parameters
beta=1;

% number of coefficients(M) are odd
%The coefficient matrix 'Coeff_mat' of the filter
%can be obtained by solving the equation :
%alpha * P' = Coeff_mat' * (alpha*A + beta*B)

%% M=21
M=21;
[P,A,B]=make_mat_eigen(passband_freq,stopband_freq,M);
%To get the 3 matrices P,A and B
C = alpha*A + beta*B;
C_transpose = C';
Coeff_mat = C_transpose\P;
[Hr,W] = Hr_Type1_eigfil_symm_odd(Coeff_mat);
%Hr is the designed filter

%Plotting the filter
figure;
plot(W/pi,Hr,'DisplayName','21');
xlabel('Frequency');
ylabel('Amplitude');
yline(0.05,'--');yline(1.05,'--');yline(-0.05,'--');
yline(0.95,'--');yline(0);yline(1);
xline(0.3,'--');xline(0.4,'--');
xticks([0:0.1:1]);
xticklabels({'0','0.1\pi','0.2\pi','0.3\pi','0.4\pi','0.5\pi','0.6\pi','0.7\pi','0.8\pi','0.9\pi','\pi'});
yticks([-0.05 0 0.05 0.95 1 1.05]);
hold on
%% M=25 
M=25;
[P,A,B]=make_mat_eigen(passband_freq,stopband_freq,M);
C=alpha*A+beta*B;
C_transpose=C';
Coeff_mat=C_transpose\P;
[Hr,W] = Hr_Type1_eigfil_symm_odd(Coeff_mat);

plot(W/pi,Hr,'DisplayName','25');
 
%% M=29 
M=29;
[P,A,B]=make_mat_eigen(passband_freq,stopband_freq,M);
C=alpha*A+beta*B;
C_transpose=C';
Coeff_mat=C_transpose\P;
[Hr,W] = Hr_Type1_eigfil_symm_odd(Coeff_mat); 

plot(W/pi,Hr,'DisplayName','29');
%% M=33 
M=33;
[P,A,B]=make_mat_eigen(passband_freq,stopband_freq,M); 
C=alpha*A+beta*B;
C_transpose=C';
Coeff_mat=C_transpose\P;
[Hr,W] = Hr_Type1_eigfil_symm_odd(Coeff_mat); 

 
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