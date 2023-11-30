clc
clear all;
syms z;
F=(z)/(3*z*z-4*z+1)
iztrans(F)
M=poles(F);
b=[1];
a=[3,-4,1];
[r,p,k]=residuez(b,a)
[b,a]=residuez(r,p,k)