% Assignment 3
% Part A - Eigenfilter (low pass)
% Name - Bipin Kumar

function [P,A,B]=make_mat_eigen(passband_freq,stopband_freq,M)
% Computes 3 matrices P,A and B needed for 
% calculating the coefficients of eigenfilter
% M = number of coefficients (should be 'odd')
% For phi = [1 cos(w) cos(2w) ... cos((M-1)w/2)]'
% P = integral(phi) over limits 0 to passband_freq
% A = integral(phi * phi') over limits 0 to passband_freq
% B = integral(phi * phi') over limits stopband_freq to pi

N=(M-1)/2;
P=zeros(N+1,1);
for i=1:N+1
    func = @(x) cos(x*(i-1));
    P(i,1)=integral(func,0,passband_freq);
end
A=zeros(N+1,N+1);
for i=1:N+1
    for j=1:N+1
        func1 = @(y) cos(y*(i-j))/2;
        func2 = @(z) cos(z*(i+j-2))/2;
        A(i,j)=integral(func1,0,passband_freq)+integral(func2,0,passband_freq);
    end
end
B=zeros(N+1,N+1);
for i=1:N+1
    for j=1:N+1
        func3 = @(a) cos(a*(i-j))/2;
        func4 = @(b) cos(b*(i+j-2))/2;
        B(i,j)=integral(func3,stopband_freq,pi)+integral(func4,stopband_freq,pi);
    end
end
