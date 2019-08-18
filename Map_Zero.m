function  Map_Zero( hObject, eventdata, handles,x, y )
%Map_Zero 当点击是0时，拓展为0的地图
%   传入参数为对象和当前坐标

global BomPosition Mapsize
queue(1,1:2)=[x,y]; %把当前0雷位置生成为队列第一个元素
length(queue(:,1))
I=1;
while I<=length(queue(:,1)) %遍历队列
    for m = queue(I,1)-1 : queue(I,1)+1
        for n = queue(I,2)-1 : queue(I,2)+1
            if 0<=m && m<Mapsize && 0<=n && n<Mapsize %规定范围
                %自动显示0雷周围的数据
                value = BomPosition(m+1,n+1);
                eval(['set(handles.xy',num2str(m*10+n), ',''string'',',num2str(value),...
                    ',''foregroundcolor'',''black'' );']);
                
                %在队列中增加新的0雷位置
                if BomPosition(m+1,n+1)==0 
                    FLAG=1; %用于标志当前查询的0雷点是否已经在队列中
                    %查询当前的0雷点是否已经在队列中
                    for h=1:length(queue(:,1))
                        if queue(h,1)==m && queue(h,2)==n %与队列中已有的数组不重复
                            FLAG=0;
                            break;
                        end
                    end
                    if FLAG==1  %没有在队列中，加入队列
                        queue(length(queue(:,1))+1,1:2) = [m n];
                    end
                end
            end
        end
    end 
    I=I+1;  %标志队列中下一个元素
end