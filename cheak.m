function cheak(hObject, eventdata, handles)
global StartFlag TimeCount BoomNum BomPosition;
if StartFlag==1
    tag = get(hObject,'tag');
    %计算当前位置坐标
    if length(tag)==4
        x = str2double(tag(3))+1;
        y = str2double(tag(4))+1;
    else
        x = 1;
        y = str2double(tag(3))+1;
    end
    %查找当前位置的数值
    value = BomPosition( x, y );
        
    if value == -1  %如果为地雷
       set(hObject,'string','*','foregroundcolor','red');
       StartFlag=0; %开始游戏标志置位1
       questdlg(['游戏失败，用时',num2str(TimeCount),'s'],'游戏失败','确定','确定'); 
    elseif value == 0   %如果为0雷位置，调用函数自动寻找0雷
        Map_Zero(hObject, eventdata, handles ,x-1,y-1);
    else %其他情况
       set(hObject,'string',num2str(value),'foregroundcolor','black');
    end
    
    %检测是否完成游戏
    FinishCount=0;
    MarkCount=0;
    for i=0:99 
        str=eval(['get(handles.xy',num2str(i), ',''string'');']);
        if(str~=' ')
            FinishCount=FinishCount+1;  %计算已经查找了的位置数量
        end
        if(strcmp(str,'标记') == 1)   %计算标记为雷的位置数量
            MarkCount=MarkCount+1;
        end
    end
    if  FinishCount==100 && MarkCount== BoomNum %已经查找所有位置，并且标记数目正确
        StartFlag=0;
        questdlg(['游戏成功，用时',num2str(TimeCount),'s'],'游戏成功','确定','确定');
    end
end
end