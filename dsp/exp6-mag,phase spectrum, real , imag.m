clc
clear all;
N=[0:1:499];
A=length(N);
f=N/A;
w=2*pi*f;
X=exp(j*w)./(exp(j*w)-0.5);
subplot(2,1,1)
plot(w,real(X))
subplot(2,1,2)
plot(w,imag(X))