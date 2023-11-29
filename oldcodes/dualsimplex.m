clc
clear all
Variables={'x_1','x_2','s_1','s_2','Sol'};
Cost=[-3 -5 0 0 0];
Info=[1,3;1,1];
b=[3;2];
s=eye(size(Info,1));
A=[Info s b];
BV=[];
for j=1:size(s,2)
    for i=1:size(A,2)
        if A(:,i)==s(:,j)
            BV=[BV i];
        end
    end
end
fprintf('basic variables (BV) = ')
disp(Variables(BV));
ZjCj= Cost(BV)*A-Cost
%printing table
ZCj=[ZjCj;A];
SimpTable=array2table(ZCj);
SimpTable.Properties.VariableNames(1:size(ZCj,2))=Variables
%dual simplex start
RUN=true;
while RUN
    SOL=A(:,end);
if any(SOL<0);
    fprintf('the current BFS is NOT FEASIBLE \n');
    %find leaving var
    [LeaVal,pvt_row]=min (SOL);
    fprintf('LEAVING ROW =%d \n',pvt_row);
    %find entering var
    ROW=A(pvt_row,1:end-1);
    ZJ=ZjCj(:,1:end-1);
    for i=1:size(ROW,2)
        if ROW(i)<0
            ratio(i)=abs(ZJ(i)./ROW(i));
        else
            ratio(i)=inf;
        end
    end
    [minVAL,pvt_col]=min(ratio);
    fprintf('ENTERING VARIABLE =%d \n',pvt_col);
    %update the bv
    BV(pvt_row)=pvt_col;
fprintf('basic variables (BV) = ')
disp(Variables(BV));
%for next iteration update the table
pvt_key=A(pvt_row,pvt_col);
A(pvt_row,:)=A(pvt_row,:)./pvt_key;
for i=1:size(A,1)
    if i~=pvt_row
        A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:);
    end
end
ZjCj=Cost(BV)*A-Cost
%for printing purpose

ZCj=[ZjCj;A];
Table=array2table(ZCj);
Table.Properties.VariableNames(1:size(ZCj,2))=Variables
else
    RUN=false;
    fprintf("current bfs is feasible and optimal\n");
end
end
%final optimal solution print
FINAL_BFS=zeros(1,size(A,2));
FINAL_BFS(BV)=A(:,end);
FINAL_BFS(end)=sum(FINAL_BFS.*Cost);
OptimalBFS=array2table(FINAL_BFS);
OptimalBFS.Properties.VariableNames(1:size(OptimalBFS,2))=Variables
