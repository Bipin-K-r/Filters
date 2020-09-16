% Assignment 3 -- Part B - Equiripple low pass filter  
% Bipin Kumar

function [Hr,W] = Hr_Type1_symm_odd(h)
% Computes Amplitude response Hr(W) of a Type-1(odd-symm)
% LowPass FIR Equiripple filter
% -----------------------------------------------------------
% Hr = Amplitude Response
% W = 1000 frequencies between [0 pi] over which Hr is computed
% h = Type-1 impulse response

M = length(h); L = (M-1)/2;
a = [h(L+1) 2*h(L:-1:1)]; % 1x(L+1) row vector
n = [0:1:L]; % (L+1)x1 column vector
W = [0:1:1000]'*pi/1000; 
Hr = cos(W*n)*a';