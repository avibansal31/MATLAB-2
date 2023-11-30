clc
clear all;
a = [0 1 2 3];
N=length(a);
X=zeros(1,N);
for k = 0:N-1
    for n=0:N-1
        X(k+1) = X(k+1)+a(n+1)*exp(-(1i *2 * pi * k *n)/N);
    end
end
disp('DFT Coefficients: ');
disp(X);
subplot(2,1,1)
z=abs(X);
stem(z)
subplot(2,1,2)
p=phase(X);
plot(X)