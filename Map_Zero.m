function  Map_Zero( hObject, eventdata, handles,x, y )
%Map_Zero �������0ʱ����չΪ0�ĵ�ͼ
%   �������Ϊ����͵�ǰ����

global BomPosition Mapsize
queue(1,1:2)=[x,y]; %�ѵ�ǰ0��λ������Ϊ���е�һ��Ԫ��
length(queue(:,1))
I=1;
while I<=length(queue(:,1)) %��������
    for m = queue(I,1)-1 : queue(I,1)+1
        for n = queue(I,2)-1 : queue(I,2)+1
            if 0<=m && m<Mapsize && 0<=n && n<Mapsize %�涨��Χ
                %�Զ���ʾ0����Χ������
                value = BomPosition(m+1,n+1);
                eval(['set(handles.xy',num2str(m*10+n), ',''string'',',num2str(value),...
                    ',''foregroundcolor'',''black'' );']);
                
                %�ڶ����������µ�0��λ��
                if BomPosition(m+1,n+1)==0 
                    FLAG=1; %���ڱ�־��ǰ��ѯ��0�׵��Ƿ��Ѿ��ڶ�����
                    %��ѯ��ǰ��0�׵��Ƿ��Ѿ��ڶ�����
                    for h=1:length(queue(:,1))
                        if queue(h,1)==m && queue(h,2)==n %����������е����鲻�ظ�
                            FLAG=0;
                            break;
                        end
                    end
                    if FLAG==1  %û���ڶ����У��������
                        queue(length(queue(:,1))+1,1:2) = [m n];
                    end
                end
            end
        end
    end 
    I=I+1;  %��־��������һ��Ԫ��
end