function cheak(hObject, eventdata, handles)
global StartFlag TimeCount BoomNum BomPosition;
if StartFlag==1
    tag = get(hObject,'tag');
    %���㵱ǰλ������
    if length(tag)==4
        x = str2double(tag(3))+1;
        y = str2double(tag(4))+1;
    else
        x = 1;
        y = str2double(tag(3))+1;
    end
    %���ҵ�ǰλ�õ���ֵ
    value = BomPosition( x, y );
        
    if value == -1  %���Ϊ����
       set(hObject,'string','*','foregroundcolor','red');
       StartFlag=0; %��ʼ��Ϸ��־��λ1
       questdlg(['��Ϸʧ�ܣ���ʱ',num2str(TimeCount),'s'],'��Ϸʧ��','ȷ��','ȷ��'); 
    elseif value == 0   %���Ϊ0��λ�ã����ú����Զ�Ѱ��0��
        Map_Zero(hObject, eventdata, handles ,x-1,y-1);
    else %�������
       set(hObject,'string',num2str(value),'foregroundcolor','black');
    end
    
    %����Ƿ������Ϸ
    FinishCount=0;
    MarkCount=0;
    for i=0:99 
        str=eval(['get(handles.xy',num2str(i), ',''string'');']);
        if(str~=' ')
            FinishCount=FinishCount+1;  %�����Ѿ������˵�λ������
        end
        if(strcmp(str,'���') == 1)   %������Ϊ�׵�λ������
            MarkCount=MarkCount+1;
        end
    end
    if  FinishCount==100 && MarkCount== BoomNum %�Ѿ���������λ�ã����ұ����Ŀ��ȷ
        StartFlag=0;
        questdlg(['��Ϸ�ɹ�����ʱ',num2str(TimeCount),'s'],'��Ϸ�ɹ�','ȷ��','ȷ��');
    end
end
end