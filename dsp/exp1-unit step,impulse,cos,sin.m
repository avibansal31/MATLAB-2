clc
clear all;
n = [-5:0,25:5];
y = 5*cos(pi*(n/2)-(pi/2));
subplot(6,2,1)
stem(n,y)
title('cos function')
n = [-5:0,25:5];
y = 5*sin(pi*(n/2)-(pi/2));
subplot(6,2,2)
stem(n,y)
title('sin function')
t = [-1:0,1:1];
impulse = t ==0;
subplot(6,2,3)
stem(t, impulse)
title("impulse")
unitstep = t >= 0;
subplot(6,2,4)
stem(t, unitstep)
title("unit step")
x = -10:10;
para = sqrt((25-x.^2)/9);
subplot(6,2,5)
stem(x, para)
title("exponential")
ramp = t.*unitstep;
subplot(6,2,6)
stem(t, ramp)
title("ramp")
