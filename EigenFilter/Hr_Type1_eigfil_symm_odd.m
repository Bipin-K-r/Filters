% Assignment 3
% Part A - Eigenfilter (low pass)
% Name - Bipin Kumar
% 170102021
function [Hr,W] = Hr_Type1_eigfil_symm_odd(h)
% Computes Amplitude response Hr(w) of a Type-1 LP FIR Eigenfilter
% -----------------------------------------------------------
% Hr = Amplitude Response
% W = 1000 frequencies between [0 pi] over which Hr is computed
% h = Type-1 LowPass filter impulse response

L = length(h);
n = [0:1:L-1];
W = [0:1:1000]'*pi/1000; 
Hr = cos(W*n)*h;
