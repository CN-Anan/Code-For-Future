function mark(hObject, eventdata, handles)
%使用右键进行标记
global StartFlag TimeCount BoomNum;
if StartFlag==1
   set(hObject,'string','标记','foregroundcolor','green');
   
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