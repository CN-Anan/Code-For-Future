function mark(hObject, eventdata, handles)
%ʹ���Ҽ����б��
global StartFlag TimeCount BoomNum;
if StartFlag==1
   set(hObject,'string','���','foregroundcolor','green');
   
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