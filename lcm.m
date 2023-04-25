clc
clear all
c=[2 10 4 5;6 12 8 11;3 9 5 7]
a=[12 25 20]
b=[25 10 15 5]
z=0;
if sum(a)==sum(b)
    fprintf('The problem is balanced')
else
    fprintf('The problem is unbalanced')
    if sum(a)<sum(b)
        
    c(end+1, :)=zeros(1,length (b))
    a(end+1)=sum(b)-sum(a)
    elseif sum(a)>sum(b)
                  c(:,end+1)=zeros(length (a),1)
                      b(end+1)=sum(a)-sum(b)
    end
end
x=zeros(size(c,1),size(c,2));
ic=c;
for i=1:size(c,1)
    for j=1:size(c,2)
        c1=min(c(:));
        if c1==Inf
            break 
        end
 
[p1,q1]=find(c1==c)
x1=min(a(p1),b(q1))
[x(p1,q1),index]= max(x1)
p=p1(index)
q=q1(index)
x(p,q)=min(a(p),b(q))

if min(a(p),b(q))==a(p)
       b(q)=b(q)-a(p)
    a(p)=a(p)-x(p,q)
     c(p,:)=Inf
else
    min(a(p),b(q)) ==b(q)
    a(p)=a(p)-b(q);
    b(q)=b(q)-x(p,q);
    c(:,q)=Inf;

end
   end
end
for i=1:size(c,1)
    for j=1:size(c,2)
        z=z+ic(i,j)*x(i,j)
    end
end
COST=sum(sum(ic.*x))
