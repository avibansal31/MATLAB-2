clc
clear all;
%a
u = [1 0 1];
v = [2 7];
w = conv(u,v)

%b
l = [ 2 6 8];
k = xcorr(u,l)

%c
x1 = numel(u);
x2 = numel(v);
if (x1 > x2)
    x1 = numel(u);
    x2 = numel(v);
    while (x1 > x2)
        v(end+1) = 0;
        x2 = numel(v);
    end
    v
else
    x1 = numel(v);
    x2 = numel(u);
    while (x1 > x2)
        u(end+1) = 0;
        x2 = numel(u);
    end
    u
end
