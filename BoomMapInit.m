function BoomMapInit( BoomNum )
%boom地图初始化，输入参数为boom数
%   此处显示详细说明
global Mapsize BomPosition;
Mapsize=10;%地图大小，不能改变

%首先重置boom地图，全部为0
for i=1:Mapsize
    for j=1:Mapsize
        BomPosition(i,j)=0;
    end
end

%生产随机数，模拟地雷位置
for i=1:BoomNum
    BoomX(i)=randperm(Mapsize,1);
    BoomY(i)=randperm(Mapsize,1);
end

i=1;
%检测是否有重复坐标的BOOM，有的话，重新生成坐标
while i<=BoomNum
    for j=i+1:BoomNum
        if( BoomX(i)==BoomX(j) && BoomY(i)==BoomY(j) )
            BoomX(j)=randperm(Mapsize,1);
            BoomY(j)=randperm(Mapsize,1);
            i=0;     %重新从1开始检测
            break;
        end
    end
    i=i+1;
end

%数组内确定boom位置，并且数值为-1
for i=1:BoomNum
    BomPosition(BoomX(i),BoomY(i))=-1;
end

%确定地雷周围的数值
for i=1:Mapsize
    for j=1:Mapsize
        if(BomPosition(i,j)~=-1)
            %检测周围地雷数
            num=0;
            for m=i-1:i+1
                for n=j-1:j+1
                    if(m<=Mapsize && m>0 && n<=Mapsize && n>0)
                        if (BomPosition(m,n)==(-1))
                            num=num+1;
                        end
                    end
                end
            end
            BomPosition(i,j)=num;
        end
    end
end

end

