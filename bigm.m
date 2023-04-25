M=1000;
C=[2,5,0,0,0,-M,-M,0];
info=[1,3,-1,0,0,1,0;1,1,0,1,0,0,0;1,-1,0,0,-1,0,1];
b=[10;6;1];

A=[info b];

BV=[4 6 7]
ZRow=C(BV)*A-C
ZjCj=[ZRow; A]

SimpTable=array2table(ZjCj)
SimpTable.Properties.VariableNames(1:size(ZjCj,2))={'x_1','x_2','s_1','s_2','s_3','a_1','a_3','sol'}
if any(ZRow<0)
    fprintf('Current BFS IS NOT OPTIMAL')
    fprintf('continue')
    disp('OLD BASIUC V(BV)=')
    disp(BV)
    ZC=ZRow(1:end-1)
    [EnterCol, Pvt_Col]=min(ZC)
    fprintf('most negative element in Z-Row is %d', EnterCol, Pvt_Col)
    fprintf('Entering Variable', Pvt_Col)
    sol=A(:,end)
    Column=A(:,Pvt_Col);
    if all(Column<=0)
        error('LPP has unbounded solution, All entries >=0 in column %d')
        else
        for i= 1:size(Column,1)
            if Column(i)>0
                ratio(i)=sol(i)./Column(i);
            else
                ratio(i)=inf;
    

            end
        end

        [MinRatio,Pvt_Row]=min(ratio);
        fprintf('Minimum ratio corresponding to the pivot row is')
        fprintf('Leaving variable is %d \n',BV(Pvt_Row))
    end
    BV(Pvt_Row)=Pvt_Col;
    disp('New Basic Variable (BV) =')
    disp(BV)
    Pvt_Key=A(Pvt_Row,Pvt_Col);
    A(Pvt_Row,:)=A(Pvt_Row,:)./Pvt_Key;
    for i=1:size(A,1)
        if i~=Pvt_Row
            A(i,:)=A(i,:)-A(i,Pvt_Col).*A(Pvt_Row,:)
        end
        ZRow=ZRow-ZRow(Pvt_Col).*A(Pvt_Row,:);
        ZjCj=[ZRow;A];
        SimpTable=array2table(ZjCj);
        SimpTable.Properties.VariableNames(1:size(ZjCj,2))={'x_1','x_2','s_1','s_2','s_3','a_1','a_3','sol'}
        
    end
       
end