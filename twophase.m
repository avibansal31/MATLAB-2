clc
clear all
C=[3 5 0 0 0];
A=[1 3 -1 0 1 0 3;1 1 0 -1 0 1 2]; 
z_new=[0 0 0 0 1 1 0];
variables = 2;
s = eye(size(A,1));
BV = [];
for i=1:size(A,2) 
    for j = 1:size(s,2) 
        if A(:,i)==s(:,j)
            BV = [BV i]
        end
    end
end
rem=BV
% PHASE 1
ZjCj = z_new(BV)*A - z_new
zcj= [A;ZjCj]
simptable = array2table(zcj)
simptable.Properties. VariableNames(1:size(zcj,2))= {'x1', 'x2', 's1', 's2', 'al','a2', 'sol'}
count = 0
RUN = true
while RUN
    zc = ZjCj(1:size(ZjCj,2)-1)
    if any(zc>0)
        count = count+1
    [max_ent, pivot] = max(zc) 
    col = A(:,pivot) 
    sol=A(:,size(A,2))
if all(col <=0)
    error('LPP is unbounded')
else
    for i=1:size(col,1)
        if col(i)>0
            xyz(i)= sol(i)/col(i)
        else
            xyz(i) = inf
        end 
    end
    [min_lev, pivot_row] = min(xyz)
end
BV(pivot_row)= pivot
B = A(:,BV)
A = inv(B)*A
ZjCj=z_new(BV)*A - z_new
zcj = [A;ZjCj]
simptable = array2table(zcj)
simptable.Properties. VariableNames(1:size(zcj,2))= {'x1', 'x2', 's1', 's2', 'al','a2','sol'}
    else RUN = false
    end 
end
% PHASE 2
A(:,rem)=[]
zjcj= C(BV)*A-C
zcj_new = [A;zjcj]
simptable = array2table(zcj_new)
simptable.Properties. VariableNames(1:size(zcj_new,2))= {'x1', 'x2', 'sl', 's2', 'sol'}
count = 0
RUN = true 
 while RUN
     zc_new = zjcj(1:size(zjcj,2)-1) 
     if any(zc_new>0)
         count = count+1
     [max_ent, pivot] = max(zc_new) 
     col = A(:,pivot)
     sol= A(:,size(A,2))
     if all(col <=0)
         error('LPP is unbounded')    
     else    
         for i=1:size(col,1)
             if col(i)>0
                 xyz(i)= sol(i)/col(i)
             else
                 xyz(i) = inf
             end
         end
         [min_lev, pivot_row] = min(xyz)
         end
        BV(pivot_row)= pivot
        B = A(:,BV)
        A = inv(B)*A
        zjcj = C(BV)*A-C
        zcj_new = [A;zjcj]
        simptable = array2table(zcj_new)
        simptable.Properties. VariableNames(1:size(zcj_new,2))= {'x1', 'x2', 'sl', 's2','sol'}
     else RUN = false
     end
 end