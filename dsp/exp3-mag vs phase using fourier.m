clc
clear all;
N=0:1:20;
A=length(N);
f=N/A;
w=2*pi*f;
X=exp(j*w)./(exp(j*w)-0.5);
magnitude=abs(X);
phase=angle(X);
subplot(2,1,1)
plot(w,magnitude)
title("Discrete Fourier Transform")
ylabel("Magnitude")
subplot(2,1,2)
plot(w,angle(X))
ylabel("Angle")