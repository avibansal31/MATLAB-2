clc
clear all;
x=[1 2 3 4 5];
y=[1 1 2 2 3];
base=[1 2 3 4 5];
subplot(3,2,3)
stem(base, x+y)
title("X+Y")

subplot(3,2,1)
stem(base,x)
title("X")
subplot(3,2,2)
stem(base,y)
title("Y")
subplot(3,2,4)
stem(base,x-y)
title("X-Y")

shift= [1 1 4 5 2];
subplot(3,2,5)
stem(base-shift,x)
title("Shifting")

subplot(3,2,6)
stem(-base,x)
title("Folding")

